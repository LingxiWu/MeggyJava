package ast_visitors;

import java.util.ArrayList;
import java.util.List;

import exceptions.SemanticException;

import symtable.SymTable;
import symtable.Type;
import symtable.Scope;
import symtable.STE;
import symtable.ClassSTE;
import symtable.MethodSTE;
import symtable.VarSTE;
import symtable.VarScope;
import ast.visitor.DepthFirstVisitor;
import ast.node.*;

public class BuildSymTable extends DepthFirstVisitor {
    
    private SymTable symTable;
    
    public BuildSymTable(){
        symTable = new SymTable();
    }
    
    public SymTable getSymTable(){
        return symTable;
    }
    
    @Override
    public void inTopClassDecl(TopClassDecl node)
    {
        // create Class STE
        String className  = node.getName();
        Scope parentScope = symTable.peekScope();
        assert (parentScope == Scope.GLOBAL);
        ClassSTE entry = new ClassSTE(className, false, new Scope(VarScope.CLASS, className, parentScope));
        if (!symTable.insert(entry)){
            throw new SemanticException(
                                        "Class "+entry.getName()+" already present in current scope!",
                                        node.getLine(),node.getPos());
        }
        //		System.out.println("About to push scope: "+className); //Debug
        symTable.pushClassScope(className);
    }
    
    @Override
    public void outTopClassDecl(TopClassDecl node){
        symTable.popScope();
    }
    
    public void inMethodDecl(MethodDecl node){
        // create method STE
        String methodName = symTable.generateMethodName(node);
        String signature = symTable.generateParamsAndRet(node);
        MethodSTE entry = new MethodSTE(methodName, signature);
        entry.setScope(new Scope(VarScope.LOCAL,methodName,symTable.peekScope()));
        if (!symTable.insert(entry)){
            throw new SemanticException(
                                        "Method "+entry.getName().replace(SymTable.DOTMANGLE, ".")+"() already defined!",
                                        node.getLine(),node.getPos());
        }
        symTable.pushMethodScope(methodName);
    }
    
    @Override
    public void visitMethodDecl(MethodDecl node){
        inMethodDecl(node);
        if(node.getType() != null){
            node.getType().accept(this);
        }
        {
            List<Formal> copy = new ArrayList<Formal>(node.getFormals());
            for(Formal p : copy){
                //                p.accept(this);
                VarSTE pSte = new VarSTE(p.getName(), this.symTable.getExpType(p), symTable.peekScope());
                if (!this.symTable.insert(pSte)){
                    throw new SemanticException(
                                                "Variable "+pSte.getName()+" already present in current scope!",
                                                p.getLine(),p.getPos());
                }
            }
        }
        {
            List<VarDecl> copy = new ArrayList<VarDecl>(node.getVarDecls());
            for(VarDecl e : copy){
                e.accept(this);
            }
        }
        {
            List<IStatement> copy = new ArrayList<IStatement>(node.getStatements());
            for(IStatement e : copy){
                e.accept(this);
            }
        }
        if(node.getExp() != null){
            node.getExp().accept(this);
        }
        
        outMethodDecl(node);
    }
    
    public void outMethodDecl(MethodDecl node){	// cheating a bit here.
        symTable.popScope();
    }
    
    public void outVoidType(VoidType node){
        symTable.setExpType(node, Type.VOID);
    }
    
    public void outByteType(ByteType node){
        symTable.setExpType(node, Type.BYTE);
    }
    
    public void outIntType(IntType node){
        symTable.setExpType(node, Type.INT);
    }
    
    public void outBoolType(BoolType node){
        symTable.setExpType(node, Type.BOOL);
    }
    
    public void outColorType(ColorType node){
        symTable.setExpType(node, Type.COLOR);
    }
    
    public void outButtonType(ButtonType node){
        symTable.setExpType(node, Type.BUTTON);
    }
    
    public void outToneType(ToneType node){
        symTable.setExpType(node, Type.TONE);
    }
    
    @Override
    public void outClassType(ClassType node){
        symTable.setExpType(node, Type.getOrMake(node.getName()));
    }
    
    
    public void outVarDecl(VarDecl node){
        Type varType  = symTable.getExpType(node.getType());
        Scope myScope = symTable.peekScope();
        VarSTE newSte = new VarSTE(node.getName(), varType, myScope);
        symTable.insert(newSte);
        symTable.setExpType(node, Type.getOrMake(node.getName()));
    }
    
    @Override
    public void outNewExp(NewExp node){
        Type classtype = Type.getOrMake(node.getId());
        //    	System.out.println("evaluating new "+classtype); // debug
        symTable.setExpType(node, classtype);
    }
    
    @Override
    public void outThisExp(ThisLiteral node){
        String className = symTable.innermostClass();
        //    	System.out.println("this exp evaluating to "+className);
        symTable.setExpType(node, Type.getOrMake(className));
    }
    
    public void outIdExp(IdLiteral node){
        
    }
    
    
    
    
}