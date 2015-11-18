package ast_visitors;

/** 
 * CheckTypes
 * 
 * This AST visitor traverses a MiniJava Abstract Syntax Tree and checks
 * for a number of type errors.  If a type error is found a SymanticException
 * is thrown
 * 
 * CHANGES to make next year (2012)
 *  - make the error messages between *, +, and - consistent <= ??
 *
 * Bring down the symtab code so that it only does get and set Type
 *  for expressions
 */

import ast.node.*;
import ast.visitor.DepthFirstVisitor;
import java.util.*;

import symtable.Type;
import exceptions.InternalException;
import exceptions.SemanticException;


import symtable.MethodSTE;
import symtable.VarSTE;
import symtable.SymTable;
import symtable.Scope;
import symtable.VarScope;
import symtable.STE;


public class CheckTypes extends DepthFirstVisitor
{
    
   private SymTable mCurrentST;
   
   public CheckTypes(SymTable st) {
     if(st==null) {
          throw new InternalException("unexpected null argument");
      }
      mCurrentST = st;
   }
   
   //========================= Overriding the visitor interface

   public void defaultOut(Node node) {
       System.err.println("Node not implemented in CheckTypes, " + node.getClass());
   }
    
   public void outLtExp(LtExp node){
       this.mCurrentST.setExpType(node, Type.BOOL);
   }
   
   public void outAndExp(AndExp node)
   {
     if(this.mCurrentST.getExpType(node.getLExp()) != Type.BOOL) {
       throw new SemanticException(
         "Invalid left operand type for operator &&",
         node.getLExp().getLine(), node.getLExp().getPos());
     }

     if(this.mCurrentST.getExpType(node.getRExp()) != Type.BOOL) {
       throw new SemanticException(
         "Invalid right operand type for operator &&",
         node.getRExp().getLine(), node.getRExp().getPos());
     }

     this.mCurrentST.setExpType(node, Type.BOOL);
   }
  
   public void outPlusExp(PlusExp node)
   {
       Type lexpType = this.mCurrentST.getExpType(node.getLExp());
       Type rexpType = this.mCurrentST.getExpType(node.getRExp());
       if ((lexpType==Type.INT  || lexpType==Type.BYTE) &&
           (rexpType==Type.INT  || rexpType==Type.BYTE)
          ){
           this.mCurrentST.setExpType(node, Type.INT);
       } else {
           throw new SemanticException(
                   "Operands to + operator must be INT or BYTE",
                   node.getLExp().getLine(),
                   node.getLExp().getPos());
       }

   }
    public void outMeggyCheckButton(MeggyCheckButton node){
        Type expType = this.mCurrentST.getExpType(node.getExp());
        if(expType != Type.BUTTON) {
            throw new SemanticException(
                                        "Invalid param for MeggyCheckButton. Must be of type BUTTON.",
                                        node.getExp().getLine(), node.getExp().getPos());
        } else {
            this.mCurrentST.setExpType(node, Type.BOOL);
        }
    }
    public void outEqualExp(EqualExp node){
        Type lexpType = this.mCurrentST.getExpType(node.getLExp());
        Type rexpType = this.mCurrentST.getExpType(node.getRExp());
        if ((lexpType==Type.INT  || lexpType==Type.BYTE) &&
            (rexpType==Type.INT  || rexpType==Type.BYTE)){
            this.mCurrentST.setExpType(node, Type.BOOL);
        } else if (lexpType==Type.BOOL && rexpType==Type.BOOL){
            this.mCurrentST.setExpType(node, Type.BOOL);
        } else if (lexpType==Type.BUTTON && rexpType==Type.BUTTON){
            this.mCurrentST.setExpType(node, Type.BOOL);
        } else if (lexpType==Type.COLOR && rexpType==Type.COLOR){
            this.mCurrentST.setExpType(node, Type.BOOL);
        } else if (lexpType == rexpType){
            this.mCurrentST.setExpType(node, Type.BOOL);
        } else {
            throw new SemanticException(
                                        "Operands to == operator must be the same type.",
                                        node.getLExp().getLine(),node.getLExp().getPos());
        }
    }
    public void outMinusExp(MinusExp node){
        Type lexpType = this.mCurrentST.getExpType(node.getLExp());
        Type rexpType = this.mCurrentST.getExpType(node.getRExp());
        if ((lexpType==Type.INT  || lexpType==Type.BYTE) &&
            (rexpType==Type.INT  || rexpType==Type.BYTE)
            ){
            this.mCurrentST.setExpType(node, Type.INT);
        } else {
            throw new SemanticException(
                                        "Operands to - operator must be INT or BYTE",
                                        node.getLExp().getLine(),
                                        node.getLExp().getPos());
        }
    }
    public void outMulExp(MulExp node){
        if(this.mCurrentST.getExpType(node.getLExp()) != Type.BYTE) {
            throw new SemanticException(
                                        "Invalid left operand type for operator *, must be BYTE.",
                                        node.getLExp().getLine(), node.getLExp().getPos());
        }
        if(this.mCurrentST.getExpType(node.getRExp()) != Type.BYTE) {
            throw new SemanticException(
                                        "Invalid right operand type for operator *, must be BYTE.",
                                        node.getRExp().getLine(), node.getRExp().getPos());
        } 
        this.mCurrentST.setExpType(node, Type.INT);
    }
    public void outWhileStatement(WhileStatement node){
        if (this.mCurrentST.getExpType(node.getExp())!=Type.BOOL){
            throw new SemanticException(
                                        "Expression in While statement must be of type BOOL.",
                                        node.getExp().getLine(), node.getExp().getPos());
        }
    }
    public void outNotExp(NotExp node){
        if(this.mCurrentST.getExpType(node.getExp()) == Type.BOOL){
            this.mCurrentST.setExpType(node, Type.BOOL);
        } else {
            throw new SemanticException(
                                        "Invalid operand type for operator '!': "+mCurrentST.getExpType(node.getExp()),
                                        node.getExp().getLine(), node.getExp().getPos());
        }
    }
    public void outNegExp(NegExp node){
        Type expType = this.mCurrentST.getExpType(node.getExp());
        if ((expType==Type.INT  || expType==Type.BYTE)){
            this.mCurrentST.setExpType(node, Type.INT);
        } else {
            throw new SemanticException(
                                        "Operands to negation operator must be INT or BYTE",
                                        node.getExp().getLine(),
                                        node.getExp().getPos());
        }
    }
    public void outByteCast(ByteCast node){
        Type expType = this.mCurrentST.getExpType(node.getExp());
        if (expType==Type.INT  || expType==Type.BYTE){
            this.mCurrentST.setExpType(node, Type.BYTE);
        } else {
            throw new SemanticException(
                                        "Operand to byte cast must be INT or BYTE",
                                        node.getExp().getLine(), node.getExp().getPos());
        }
    }
    public void outIntegerExp(IntLiteral node){
        this.mCurrentST.setExpType(node, Type.INT);
    }
    public void outButtonExp(ButtonLiteral node){
        this.mCurrentST.setExpType(node, Type.BUTTON);
    }
    public void outTrueExp(TrueLiteral node){
        this.mCurrentST.setExpType(node, Type.BOOL);
    }
    public void outFalseExp(FalseLiteral node){
        this.mCurrentST.setExpType(node, Type.BOOL);
    }
    public void outColorExp(ColorLiteral node){
        this.mCurrentST.setExpType(node, Type.COLOR);
    }
    @Override
    public void outToneExp(ToneLiteral node){
        this.mCurrentST.setExpType(node, Type.TONE);
    }
    
    public void outMeggySetPixel(MeggySetPixel node){
        Type xExpType = this.mCurrentST.getExpType(node.getXExp());
        Type yExpType = this.mCurrentST.getExpType(node.getYExp());
        Type colorType = this.mCurrentST.getExpType(node.getColor());
        if(xExpType != Type.BYTE) {
            throw new SemanticException(
                                        "Invalid first param for MeggySetPixel. Must be of type BYTE, but found type "+node.getXExp(),
                                        node.getXExp().getLine(), node.getXExp().getPos());
        } else if(yExpType != Type.BYTE) {
            throw new SemanticException(
                                        "Invalid second param for MeggySetPixel. Must be of type BYTE, but found type "+yExpType,
                                        node.getYExp().getLine(), node.getYExp().getPos());
        } else if(colorType != Type.COLOR) {
            throw new SemanticException(
                                        "Invalid third param for MeggySetPixel. Must be of type COLOR, but found type "+colorType,
                                        node.getColor().getLine(), node.getColor().getPos());
        } 
    }
    
    
    @Override
    public void inTopClassDecl(TopClassDecl node)
    {
        //    	System.out.println("AVRGen Entering top class decl"); //Debug
        // create Class STE
        String className  = node.getName();
        Scope parentScope = mCurrentST.peekScope();
        assert (parentScope == Scope.GLOBAL);
        try {
            mCurrentST.pushClassScope(className);
        } catch (ClassCastException e){
            throw new SemanticException(
                                        "Cannot declare class "+node.getName()+"; identifier is already\n" +
                                        "used as method name",
                                        node.getLine(),node.getPos());
        }
    }
    
    @Override
    public void outTopClassDecl(TopClassDecl node){
        mCurrentST.popScope();
    }
    
    @Override
    public void inMethodDecl(MethodDecl node){
        //    	System.out.println("Current scope = "+symTable.peekScope().getName()); //debug
        try {
            this.mCurrentST.pushMethodScope(mCurrentST.generateMethodName(node));
        } catch (ClassCastException e){
            throw new SemanticException(
                                        "Cannot declare method "+node.getName()+"; identifier is already\n" +
                                        "used as class name",
                                        node.getLine(),node.getPos());
        }
        if (node.getNumExpChildren() > 9){
            throw new SemanticException(
                                        "Too many parameters in method "+node.getName(),
                                        node.getLine(),node.getPos());
        }
    }
    
    @Override
    public void outMethodDecl(MethodDecl node){
        if (node.getExp() == null) this.mCurrentST.setExpType(node.getExp(), Type.VOID);
        Type retType = this.mCurrentST.typeFromIType(node.getType());
        Type retExpType = this.mCurrentST.getExpType(node.getExp());
        if (retType != retExpType){
            throw new SemanticException(
                                        "Return type of "+retType+" required for method "+node.getName()+";\n" +
                                        "Given return expression is of type " + retExpType,
                                        node.getLine(),node.getPos());
        }
        this.mCurrentST.setExpType(node, retType);
        this.mCurrentST.popScope();
    }
    
    @Override
    public void outCallStatement(CallStatement node){
        
        if(node==null){                     //debug
            System.out.println("CallStatement node is NULL");
        }
        
        this.mCurrentST.setExpType(node, outGenericCall(node));
    }
    
    @Override
    public void outCallExp(CallExp node){
        
        if(node==null){                     //debug
            System.out.println("CallExp node is NULL");
        }
        
        this.mCurrentST.setExpType(node, outGenericCall(node));
    }
    
    private Type outGenericCall(GenericCall node){
        
        if(node.getExp()==null){                     //debug
            System.out.println("outGenericCall GenericCall node is NULLLLLLLLLLLL");
        }
        
        String containingClass = mCurrentST.getExpType(node.getExp()).toString();
        //		System.out.println("About to push class scope: "+containingClass);//debug
        try {
            mCurrentST.pushClassScope(containingClass);
        } catch (ClassCastException e){
            throw new SemanticException(
                                        "Cannot declare class "+node.getId()+"; identifier is already\n" +
                                        "used as method name",
                                        node.getLine(),node.getPos());
        }
        String methodName = mCurrentST.generateMethodName(node);
        //		System.out.println("About to look up " +methodName); // Debug
        MethodSTE methodEntry = (MethodSTE) this.mCurrentST.lookup(methodName);
        LinkedList<IExp> args = node.getArgs();
        String argSig = this.mCurrentST.generateParamSig(args);
        if (methodEntry != null){
            String methodSig = methodEntry.getSignature();
            String paramSig = methodSig.substring(0, methodSig.lastIndexOf(", )")+3);
            if (!paramSig.equals(argSig)){
                throw new SemanticException(
                                            "Invalid arguments for method "+methodName+"\n"+
                                            "Required: "+paramSig+
                                            "\nFound: "+argSig+"\n",
                                            node.getLine(),node.getPos());
            }
            String retSig = methodSig.substring(methodSig.lastIndexOf("returns ")+8);
            mCurrentST.popScope();
            return Type.parseType(retSig);
        }
        else {
            throw new SemanticException(
                                        "Method "+methodName+" not recognized.",
                                        node.getLine(),node.getPos());
        }
    }
    
    
    
    
    
    

    
    
    
    @Override
    public void outMeggyToneStart(MeggyToneStart node){
        Type toneType = this.mCurrentST.getExpType(node.getToneExp());
        Type durType = this.mCurrentST.getExpType(node.getDurationExp());
        if(toneType != Type.TONE) {
            throw new SemanticException(
                                        "Invalid first param for MeggyToneStart. Must be of type TONE.",
                                        node.getToneExp().getLine(), node.getToneExp().getPos());
        } else if(durType != Type.INT) {
            throw new SemanticException(
                                        "Invalid second param for MeggyToneStart. Must be of type INT.",
                                        node.getDurationExp().getLine(), node.getDurationExp().getPos());
        }
    }
    
    public void outMeggyDelay(MeggyDelay node){
        Type expType = this.mCurrentST.getExpType(node.getExp());
        if(expType != Type.INT) {
            throw new SemanticException(
                                        "Invalid param for MeggyDelay. Must be of type INT.",
                                        node.getExp().getLine(), node.getExp().getPos());
        }
    }
    
    public void outMeggyGetPixel(MeggyGetPixel node){
        Type xExpType = this.mCurrentST.getExpType(node.getXExp());
        Type yExpType = this.mCurrentST.getExpType(node.getYExp());
        if(xExpType != Type.BYTE) {
            throw new SemanticException(
                                        "Invalid first param for MeggyGetPixel. Must be of type BYTE.",
                                        node.getXExp().getLine(), node.getXExp().getPos());
        } else if(yExpType != Type.BYTE) {
            throw new SemanticException(
                                        "Invalid second param for MeggyGetPixel. Must be of type BYTE.",
                                        node.getYExp().getLine(), node.getYExp().getPos());
        } else {
            this.mCurrentST.setExpType(node, Type.COLOR);
        }
    }
    
    public void outFormal(Formal node){
        this.mCurrentST.setExpType(node, this.mCurrentST.typeFromIType(node.getType()));
    }
    
    public void outIfStatement(IfStatement node){
        //		System.out.println("type = "+this.mCurrentST.getExpType(node.getExp()));
        if (this.mCurrentST.getExpType(node.getExp())!=Type.BOOL){
            throw new SemanticException(
                                        "Expression in If statement must be of type BOOL.",
                                        node.getExp().getLine(), node.getExp().getPos());
        }
    }
    
    public void outIdLiteral(IdLiteral node){
        VarSTE idSte = (VarSTE) this.mCurrentST.lookup(node.getLexeme());
        if (idSte == null){
            this.mCurrentST.setExpType(node, Type.VOID);
        }
        else {
            this.mCurrentST.setExpType(node, idSte.getType());
        }
    }
    

    public void outBlockStatement(BlockStatement node){
        
    }
    
    @Override
    public void outThisExp(ThisLiteral node){
        /* Do Nothing */
    }
    
    @Override
    public void outProgram(Program node){
        
    }
    
    @Override
    public void outMainClass(MainClass node){
        
    }
    
    public void outNewExp(NewExp node){
        
    }
    
    public void outVoidType(VoidType node){
        
    }
    
    public void outByteType(ByteType node){
        
    }
    
    public void outIntType(IntType node){
        
    }
    
    public void outBoolType(BoolType node){
        
    }
    
    public void outColorType(ColorType node){
        
    }
    
    public void outButtonType(ButtonType node){
        
    }
    
    public void outToneType(ToneType node){
        
    }
}
