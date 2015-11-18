package ast_visitors;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;
import java.util.ListIterator;

import exceptions.SemanticException;

import label.Label;

import symtable.Scope;
import symtable.ClassSTE;
import symtable.STE;
import symtable.VarScope;
import symtable.VarSTE;
import symtable.SymTable;
import symtable.Type;
import ast.visitor.DepthFirstVisitor;
import ast.node.*;

public class AVRgenVisitor extends DepthFirstVisitor {
	
	private PrintWriter avrWriter;
	private SymTable symTable;
	
	private int labelNum = 0;
	
	public AVRgenVisitor(PrintWriter pOut, SymTable sTable){
		avrWriter = pOut;
		symTable = sTable;
	}
	
	private String getNextLabel(){
		return new Label().toString();
//		return "MJ_L"+(labelNum++);
	}
	
    private void promoteByteToInt(){	// Uses registers 26,27
        String ifNegative = getNextLabel();
        String elsPositive = getNextLabel();
        avrWriter.write("\t#promoting a byte to an int\n" +
                        "\tpop\t\tr26\n" +
                        "\ttst\t\tr26\n" +
                        "\tbrlt\t"+ifNegative+"\n" +
                        "\tldi\t\tr27, 0\n" +
                        "\tjmp\t"+elsPositive+"\n" +
                        ifNegative+":\n" +
                        "\tldi\t\tr27, hi8(-1)\n" +
                        elsPositive+":\n" +
                        "\tpush\tr27\n" +
                        "\tpush\tr26\n");
    }
	
	@Override
	public void inProgram(Program node){
//        System.out.println("Generate prolog using avrH.rtl.s");
        InputStream mainPrologue=null;
        BufferedReader reader=null;
        try {
            mainPrologue 
                = this.getClass().getClassLoader().getResourceAsStream(
                    "avrH.rtl.s");
            reader = new BufferedReader(new 
                InputStreamReader(mainPrologue));

            String line = null;
            while ((line = reader.readLine()) != null) {
              avrWriter.println(line);
            }
        } catch ( Exception e2) {
            e2.printStackTrace();
        }
        finally{
            try{
                if(mainPrologue!=null) mainPrologue.close();
                if(reader!=null) reader.close();
            }
            catch (IOException e) {
               e.printStackTrace();
            }
        }
        avrWriter.println();
        avrWriter.println();
	}
	
	@Override
	public void outProgram(Program node){
      avrWriter.flush();
	}
	
	@Override
	public void outMainClass(MainClass node){
//      System.out.println("Generate prolog using avrH.rtl.s");
      InputStream mainEpilogue=null;
      BufferedReader reader=null;
      try {
          mainEpilogue 
              = this.getClass().getClassLoader().getResourceAsStream(
                  "avrF.rtl.s");
          reader = new BufferedReader(new 
              InputStreamReader(mainEpilogue));

          String line = null;
          while ((line = reader.readLine()) != null) {
            avrWriter.println(line);
          }
      } catch ( Exception e2) {
          e2.printStackTrace();
      }
      finally{
          try{
              if(mainEpilogue!=null) mainEpilogue.close();
              if(reader!=null) reader.close();
          }
          catch (IOException e) {
             e.printStackTrace();
          }
      }
	}
	
	@Override
	public void outMeggySetPixel(MeggySetPixel node){
		avrWriter.write("\t### Meggy.setPixel(x,y,color) call\n" +
				"\t# load a one byte expression off stack\n" +
				"\tpop\t\tr20\n" +
				"\t# load a one byte expression off stack\n" +
				"\tpop\t\tr22\n" +
				"\t# load a one byte expression off stack\n" +
				"\tpop\t\tr24\n" +
				"\tcall\t_Z6DrawPxhhh\n" +
				"\tcall\t_Z12DisplaySlatev\n\n");
	}
    
    @Override
    public void outMeggyToneStart(MeggyToneStart node){
        avrWriter.write("\t### Meggy.toneStart(tone, time_ms) call\n" +
                        "\t# load a two byte expression off stack\n" +
                        "\tpop\t\tr22\n" +
                        "\tpop\t\tr23\n" +
                        "\t# load a two byte expression off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tpop\t\tr25\n" +
                        "\tcall\t_Z10Tone_Startjj\n\n");
    }
    
    @Override
    public void outMeggyDelay(MeggyDelay node){
        avrWriter.write("\t### Meggy.delay() call\n" +
                        "\t# load delay parameter\n" +
                        "\t# load a two byte expression off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tpop\t\tr25\n" +
                        "\tcall\t_Z8delay_msj\n\n");
    }
    
    @Override
    public void visitIfStatement(IfStatement node){
        inIfStatement(node);
        String thenLabel = getNextLabel();
        String elseLabel = getNextLabel();
        String doneLabel = getNextLabel();
        if(node.getExp() != null)
        {
            node.getExp().accept(this);
        }
        avrWriter.write("\t# load condition and branch if false\n" +
                        "\t# load a boolean expression off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\t#load zero into reg\n" +
                        "\tldi\t\tr25, 0\n" +
                        "\t#use cp to set SREG\n" +
                        "\tcp\t\tr24, r25\n" +
                        "\t#WANT breq "+elseLabel+"\n" +
                        "\tbrne\t"+thenLabel+"\n" +
                        "\tjmp\t\t"+elseLabel+"\n\n" +
                        "\t# then label for if\n" +
                        thenLabel+":\n\n");
        if(node.getThenStatement() != null)
        {
            node.getThenStatement().accept(this);
        }
        avrWriter.write("# skip else clause\n" +
                        "\tjmp\t"+doneLabel+"\n\n" +
                        "\t# else label for if\n" +
                        elseLabel+":\n\n");
        if(node.getElseStatement() != null)
        {
            node.getElseStatement().accept(this);
        }
        avrWriter.write("\t# done label for if\n" +
                        doneLabel+":\n\n");
        outIfStatement(node);
    }
    
    @Override
    public void inIfStatement(IfStatement node){
        avrWriter.write("\t#### if statement\n\n");
    }
    
    @Override
    public void visitWhileStatement(WhileStatement node){
        inWhileStatement(node);
        String whileStart = getNextLabel();
        String bodyLabel = getNextLabel();
        String endLabel = getNextLabel();
        avrWriter.write(whileStart+":\n\n");
        if(node.getExp() != null)
        {
            node.getExp().accept(this);
        }
        avrWriter.write("\t# check condition, jump if false\n" +
                        "\t# load a boolean expression off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tldi\t\tr25,0\n" +
                        "\tcp\t\tr24, r25\n" +
                        "\t# WANT breq "+endLabel+"\n" +
                        "\tbrne\t"+bodyLabel+"\n" +
                        "\tjmp\t\t"+endLabel+"\n\n" +
                        "\t# while loop body\n" +
                        bodyLabel+":\n");
        if(node.getStatement() != null)
        {
            node.getStatement().accept(this);
        }
        avrWriter.write("\t# jump to while test\n" +
                        "\tjmp\t"+whileStart+"\n\n" +
                        "\t# end of while\n" +
                        endLabel+":\n\n");
        outWhileStatement(node);
    }
    
    @Override
    public void inWhileStatement(WhileStatement node){
        avrWriter.write("\t#### while statement\n");
    }
    
    @Override
    public void outNegExp(NegExp node){
        // Check if node is a byte; if so, promote to int
        if (symTable.getExpType(node) == Type.BYTE){
            promoteByteToInt();
        }
        // Negate int
        avrWriter.write("\t# negating int\n" +
                        "\t# load an int off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tpop\t\tr25\n" +
                        "\tldi\t\tr22, 0\n" +
                        "\tldi\t\tr23, 0\n" +
                        "\tsub\t\tr22, r24\n" +
                        "\tsbc\t\tr23, r25\n" +
                        "\t# push two byte expression onto stack\n" +
                        "\tpush\tr23\n" +
                        "\tpush\tr22\n\n");
    }
    
    @Override
    public void outPlusExp(PlusExp node){
        if (symTable.getExpType(node.getRExp()) == Type.BYTE){
            promoteByteToInt();
        }
        avrWriter.write("\t# load an int off stack\n" +
                        "\tpop\t\tr18\n" +
                        "\tpop\t\tr19\n");
        if (symTable.getExpType(node.getLExp()) == Type.BYTE){
            promoteByteToInt();
        }
        avrWriter.write("\t# load an int off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tpop\t\tr25\n");
        avrWriter.write("\t# Do add operation\n" +
                        "\tadd\t\tr24, r18\n" +
                        "\tadc\t\tr25, r19\n" +
                        "\t# push two byte expression onto stack\n" +
                        "\tpush\tr25\n" +
                        "\tpush\tr24\n\n");
        
    }
    
    @Override
    public void outMinusExp(MinusExp node){
        if (symTable.getExpType(node.getRExp()) == Type.BYTE){
            promoteByteToInt();
        }
        avrWriter.write("\t# load an int off stack\n" +
                        "\tpop\t\tr18\n" +
                        "\tpop\t\tr19\n");
        if (symTable.getExpType(node.getLExp()) == Type.BYTE){
            promoteByteToInt();
        }
        avrWriter.write("\t# load an int off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tpop\t\tr25\n");
        avrWriter.write("\t# Do subtraction operation\n" +
                        "\tsub\t\tr24, r18\n" +
                        "\tsbc\t\tr25, r19\n" +
                        "\t# push two byte expression onto stack\n" +
                        "\tpush\tr25\n" +
                        "\tpush\tr24\n\n");
    }
    
    @Override
    public void outMulExp(MulExp node){
        avrWriter.write("\t# Multiplication (BYTE x BYTE ONLY! Returns int)\n" +
                        "\t# load a byte off stack\n" +
                        "\tpop\t\tr18\n" +
                        "\t# load a byte off stack\n" +
                        "\tpop\t\tr22\n" +
                        "\t# move one byte src into dest reg\n" +
                        "\tmov\t\tr24, r18\n" +
                        "\t# move one byte src into dest reg\n" +
                        "\tmov\t\tr26, r22\n" +
                        "\t# Do mul operation of two input bytes\n" +
                        "\tmuls\tr24, r26\n" +
                        "\t# push two-byte expression onto stack\n" +
                        "\tpush\tr1\n" +
                        "\tpush\tr0\n" +
                        "\t# clear r0 and r1\n" +
                        "\teor\t\tr0,r0\n" +
                        "\teor\t\tr1,r1\n\n");
    }
    
    @Override
    public void visitAndExp(AndExp node)
    {
        inAndExp(node);
        if(node.getLExp() != null)
        {
            node.getLExp().accept(this);
        }
        String noREval = getNextLabel();
        String doREval = getNextLabel();
        avrWriter.write("\t# &&: if left operand is false do not eval right\n" +
                        "\t# load a one byte expression off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\t# compare left exp with zero\n" +
                        "\tldi\t\tr25, 0\n" +
                        "\tcp\t\tr24, r25\n" +
                        "\t# Want this, breq "+noREval+"\n" +
                        "\tbrne\t"+doREval+"\n" +
                        "\t# We're skipping right exp, so push left val (false) for eval\n" +
                        "\tpush\tr24\n" +
                        "\tjmp\t\t"+noREval+"\n\n" +
                        doREval+":\n");
        if(node.getRExp() != null)
        {
            node.getRExp().accept(this);
        }
        avrWriter.write(noREval+":\n\n");
        outAndExp(node);
    }
    
    @Override
    public void inAndExp(AndExp node){
        avrWriter.write("\t### short-circuited && op\n" +
                        "\t# &&: eval left operand\n\n");
    }
    
    @Override
    public void outAndExp(AndExp node){
    }
    
    @Override
    public void outEqualExp(EqualExp node){
        avrWriter.write("\t## equality check expression\n");
        if (symTable.getExpType(node.getRExp()) != Type.INT){
            promoteByteToInt();
        }
        avrWriter.write("\t# load a two-byte expression off stack\n" +
                        "\tpop\t\tr18\n" +
                        "\tpop\t\tr19\n");
        if (symTable.getExpType(node.getLExp()) != Type.INT){
            promoteByteToInt();
        }
        String resultFalse = getNextLabel();
        String resultTrue = getNextLabel();
        String storeResult = getNextLabel();
        avrWriter.write("\t# load a two-byte expression off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tpop\t\tr25\n" +
                        "\tcp\t\tr24, r18\n" +
                        "\tcpc\t\tr25, r19\n" +
                        "\tbreq\t"+resultTrue+"\n" +
                        "\t# result is false\n" +
                        resultFalse+":\n" +
                        "\tldi\t\tr24, 0\n" +
                        "\tjmp\t\t"+storeResult+"\n" +
                        "\t# result is true\n" +
                        resultTrue+":\n" +
                        "\tldi\t\tr24, 1\n" +
                        "\t# store result of equal expression\n" +
                        storeResult+":\n" +
                        "\tpush\tr24\n\n");
    }

	@Override
	public void outByteCast(ByteCast node){
		if (symTable.getExpType(node.getExp()) == Type.BYTE){
			avrWriter.write("\t#casting byte to byte: do nothing\n\n");
			return;
		}
		avrWriter.write("\t# Casting int to byte by popping\n"+
						"\t# 2 bytes off stack and only pushing low order bits\n"+
						"\t# back on.  Low order bits are on top of stack.\n"+
						"\tpop\t\tr24\n"+
						"\tpop\t\tr25\n"+
						"\tpush\tr24\n\n");
	}
	
	@Override
	public void outIntegerExp(IntLiteral node){
		int iValue = node.getIntValue();
	    avrWriter.write("\t# Load constant int "+iValue+"\n"+
	    				 "\tldi\t\tr24,lo8("+iValue+")\n"+
	    				 "\tldi\t\tr25,hi8("+iValue+")\n"+
	    				 "\t# push two byte expression onto stack\n"+
	    				 "\tpush\tr25\n"+
	    				 "\tpush\tr24\n\n");
	}
	
	@Override
	public void outColorExp(ColorLiteral node){
		avrWriter.write("\t# Color expression "+node.getLexeme()+"\n"+
                        "\t# load a one byte expression off stack\n"+
						"\tldi\t\tr22,"+node.getIntValue()+"\n"+
						"\t# load a one byte expression off stack\n"+
					    "\tpush\tr22\n\n");

	}
    
    @Override
    public void outToneExp(ToneLiteral node){
        avrWriter.write("\t# Meggy Tone expression "+node.getLexeme()+"\n"+
                        "\tldi\t\tr25, hi8("+node.getIntValue()+")\n"+
                        "\tldi\t\tr24, lo8("+node.getIntValue()+")\n"+
                        "\t# push two byte expression onto stack\n" +
                        "\tpush\tr25\n" +
                        "\tpush\tr24\n\n");
        
    }
    
    @Override
    public void outButtonExp(ButtonLiteral node){
        avrWriter.write("\t# Button expression "+node.getLexeme()+"\n"+
                        "\tldi\t\tr22,"+node.getIntValue()+"\n"+
                        "\t# push onto stack as single byte\n"+
                        "\tpush\tr22\n\n");
    }
    
    @Override
    public void outFalseExp(FalseLiteral node){
        avrWriter.write("\t# False literal\n"+
                        "\tldi\t\tr22,"+node.getIntValue()+"\n"+
                        "\t# push onto stack as single byte\n"+
                        "\tpush\tr22\n\n");
    }
    
    @Override
    public void outTrueExp(TrueLiteral node){
        avrWriter.write("\t# True/1 expression\n"+
                        "\tldi\t\tr22,"+node.getIntValue()+"\n"+
                        "\t# push onto stack as single byte\n"+
                        "\tpush\tr22\n\n");
    }
    
    @Override
    public void outNotExp(NotExp node){
        avrWriter.write("\t# not operation\n"+
                        "\t# load a one byte expression off stack\n"+
                        "\tpop\t\tr24\n"+
                        "\tldi\t\tr22, 1\n"+
                        "\teor\t\tr24,r22\n"+
                        "\t# push one byte expression onto stack\n"+
                        "\tpush\tr24\n\n");
    }
    
    @Override
    public void outMeggyGetPixel(MeggyGetPixel node){
        avrWriter.write("### Meggy.getPixel(x,y) call\n"+
                        "\t# load a one byte expression off stack\n"+
                        "\tpop\t\tr22\n"+
                        "\t# load a one byte expression off stack\n"+
                        "\tpop\t\tr24\n"+
                        "\tcall\t_Z6ReadPxhh\n"+
                        "\t# push result color onto stack\n"+
                        "\tpush\tr24\n\n");
    }
    
    @Override
    public void outMeggyCheckButton(MeggyCheckButton node){
        ButtonLiteral button = (ButtonLiteral) node.getExp();
        String[] splitName = button.getLexeme().split("\\.");
        String button_name = splitName[1];
        for (int i = 2; i < splitName.length; ++i){
            button_name += "_"+splitName[i];
        }
        avrWriter.write("\t### MeggyCheckButton\n"+
                        "\tcall\t_Z16CheckButtonsDownv\n"+
                        "\tlds\t\tr24, "+button_name+"\n" +
                        "\tpush\tr24\n\n");
    }
	
	@Override
	public void outIdLiteral(IdLiteral node){
		avrWriter.write("\t# IdExp:\n" +
				"\t# load into register using base,offset\n" +
				"\t# push onto stack\n");
		//System.out.println("About to do lookup: AVRgenVisitor.outIdLiteral");//debug
		VarSTE localVar = (VarSTE) this.symTable.lookup(node.getLexeme());
		//System.out.println("var is "+localVar);
		int offset = localVar.getOffset();
		//System.out.println("Offset = "+offset);
		String base = null;
		switch (localVar.getBase()){
			case CLASS: base = "Z"; break;
			case LOCAL: base = "Y"; break;
			default: assert false;
		}
		//System.out.println("Var type is "+localVar.getType());
		//System.out.println("Var size is "+localVar.getType().getAVRTypeSize());
		if (localVar.getType().getAVRTypeSize() == 2){
			avrWriter.write("\tldd\t\tr24, "+base+"+"+(offset+1)+"\n" +
				"\tpush\tr24\n");
		}
		avrWriter.write("\tldd\t\tr24, "+base+"+"+offset+"\n" +
			"\tpush\tr24\n\n");
	}
    
    @Override
    public void outLtExp(LtExp node){
        avrWriter.write("\t## less-than check expression\n");
        if (symTable.getExpType(node.getRExp()) != Type.INT){
            promoteByteToInt();
        }
        avrWriter.write("\t# load a two-byte expression off stack\n" +
                        "\tpop\t\tr18\n" +
                        "\tpop\t\tr19\n");
        if (symTable.getExpType(node.getLExp()) != Type.INT){
            promoteByteToInt();
        }
        String resultFalse = getNextLabel();
        String resultTrue = getNextLabel();
        String storeResult = getNextLabel();
        avrWriter.write("\t# load a two-byte expression off stack\n" +
                        "\tpop\t\tr24\n" +
                        "\tpop\t\tr25\n" +
                        "\tcp\t\tr24, r18\n" +
                        "\tcpc\t\tr25, r19\n" +
                        "\tbrlt\t"+resultTrue+"\n" +
                        "\t# result is false\n" +
                        resultFalse+":\n" +
                        "\tldi\t\tr24, 0\n" +
                        "\tjmp\t\t"+storeResult+"\n" +
                        "\t# result is true\n" +
                        resultTrue+":\n" +
                        "\tldi\t\tr24, 1\n" +
                        "\t# store result of less than (one byte)\n" +
                        storeResult+":\n" +
                        "\tpush\tr24\n\n");
    }
    
    @Override
    public void inTopClassDecl(TopClassDecl node)
    {
        //   	System.out.println("AVRGen Entering top class decl"); //Debug
        // create Class STE
        String className  = node.getName();
        Scope parentScope = symTable.peekScope();
        assert (parentScope == Scope.GLOBAL);
        //System.out.println(className); //Debug
        symTable.pushClassScope(className);
    }
    
    @Override
    public void outTopClassDecl(TopClassDecl node){
        String brlt = getNextLabel();
        String popr = getNextLabel();
        String className  = node.getName();
        symTable.popScope();
    }
    
    @Override
    public void inMethodDecl(MethodDecl node){
        String methodName = symTable.generateMethodName(node);
        this.symTable.pushMethodScope(methodName);
        List<Formal> params = node.getFormals();
        List<VarDecl> locals = node.getVarDecls();
        avrWriter.write("\t/* prologue start for function "+methodName+" */\n" +
                        "\t.text\n"+
                        ".global " + methodName + "\n" +
                        "\t.type " + methodName + ", @function\n" +
                        methodName + ":\n" +
                        "\tpush\tr29\n" +
                        "\tpush\tr28\n" +
                        "\t# make space for locals and params\n"+
                        "\tldi\t\tr30, 0\n");
        int paramRegister = 24 - 2*(params.size() + locals.size());		// Register where the next parameter is stored.
        ListIterator<VarDecl> iter1 = locals.listIterator(locals.size());
        VarDecl v;
        while(iter1.hasPrevious()){
            v = iter1.previous();
            avrWriter.write("\t# Store local var\n");
            if (this.symTable.getExpType(v).getAVRTypeSize() == 2){
                avrWriter.write("\tpush\tr"+(paramRegister+1)+"\n");
            }
            avrWriter.write("\tpush\tr"+paramRegister+"\n");
            paramRegister += 2;
        }
        ListIterator<Formal> iter = params.listIterator(params.size());
        Formal p;
        
        //push*params counts
        avrWriter.write("\tpush\tr30\n"+
                        "\tpush\tr30\n");
        while(iter.hasPrevious()){
            p = iter.previous();
            //if (this.symTable.getExpType(p).getAVRTypeSize() == 2){
            //}
            avrWriter.write("\tpush\tr30\n");
            paramRegister += 2;
        }
        avrWriter.write("\n\t# copy stack pointer to frame pointer\n"+
                        "\tin\t\tr28, __SP_L__\n"+
                        "\tin\t\tr29, __SP_H__\n\n");
        avrWriter.write("\t# save off parameters\n");
        
        //store rxx in memory location Y+x
        avrWriter.write("\tstd\t\tY+2,r25\n"+
                        "\tstd\t\tY+1,r24\n");
        int offsetter=3;
        while(iter.hasNext()){
            p = iter.next();
            paramRegister -= 2;
            avrWriter.write("\tstd\t\tY+"+ (offsetter) +",r"+ paramRegister +"\n");
            offsetter += 1;
            if(iter.hasNext()){
                if(iter.next()!=null){
                    paramRegister -= 2;
                    avrWriter.write("\tstd\t\tY+"+ (offsetter) +",r"+ paramRegister +"\n");
                    offsetter += 1;
                }
            }//}
            //else{
            //    avrWriter.write("\tstd\t\tY+"+ (offsetter) +",r"+ paramRegister +"\n");
            //    paramRegister -= 1;
            //    offsetter += 1;
            //}
        }
        avrWriter.write("/* done with function "+methodName+" prologue */\n\n");
    }
    
    @Override
    public void outMethodDecl(MethodDecl node){
        symTable.popScope();
        String methodName = symTable.generateMethodName(node);
        avrWriter.write("/* epilogue start for " + methodName + " */\n");
        if (node.getExp() != null){
            avrWriter.write("\t# handle return value\n");
            avrWriter.write("\tpop\t\tr24\n");
            if (this.symTable.getExpType(node.getExp()) == Type.INT){
                avrWriter.write("\tpop\t\tr25\n");
                
                
                
                
                
                
            }
        }
        else{
            avrWriter.write("\t# no return value\n");
        }
        avrWriter.write("\t# pop receiver\n"+
                        "\tpop\t\tr30\n"+
                        "\tpop\t\tr30\n");
        avrWriter.write("\t# pop space off stack for parameters and locals\n");
        List<Formal> params   = node.getFormals();
        List<VarDecl> locals = node.getVarDecls();
        for (Formal p : params){
            for (int i = 0; i < this.symTable.getExpType(p).getAVRTypeSize(); ++i){
                avrWriter.write("\tpop\t\tr30\n");
            }
        }
        for (VarDecl v : locals){
            for (int i = 0; i < this.symTable.getExpType(v).getAVRTypeSize(); ++i){
                avrWriter.write("\tpop\t\tr30\n");
            }
        }
        avrWriter.write("\n"+
                        "\t# restoring the frame pointer\n"+
                        "\tpop\t\tr28\n"+
                        "\tpop\t\tr29\n\n" +
                        "\tret\n"+
                        "\t.size " + methodName + ", .-" + methodName + "\n\n");
    }
    
    @Override
    public void outCallExp(CallExp node){
        outGenericCall(node);
        handleReturn(this.symTable.getExpType(node));
    }
    
    @Override
    public void outCallStatement(CallStatement node){
        outGenericCall(node);
        handleReturn(this.symTable.getExpType(node));
    }
    
    private void outGenericCall(GenericCall node){
        List<IExp> args = node.getArgs();
        avrWriter.write("\t#### function call\n" +
                        "\t# put parameter values into appropriate registers\n" +
                        "\t# receiver will be passed as first param\n" +
                        "\t# load a two byte expression off stack\n");
        int argRegister = 24 - 2*args.size();
        ListIterator<IExp> iter = args.listIterator(args.size());
        IExp arg;
        while(iter.hasPrevious()){
            arg = iter.previous();
            avrWriter.write("\t# next arg\n"+
                            "\tpop\t\tr"+(argRegister)+"\n");
            
            if(arg==null){                     //debug
                System.out.println("arg is NULL");
            }
            
            if (this.symTable.getExpType(arg).getAVRTypeSize() == 2){
                avrWriter.write("\tpop\t\tr"+(argRegister+1)+"\n");
            }
            argRegister += 2;
        }
        avrWriter.write("\t# receiver\n"+
                        "\tpop\t\tr24\n"+
                        "\tpop\t\tr25\n"+
                        "\n\tcall\t"+symTable.generateMethodName(node)+"\n\n");
    }
    
    private void handleReturn(Type retType){
        if (retType != Type.VOID && retType != null){
            avrWriter.write("\t# handle return value\n");
            if (retType.getAVRTypeSize() == 2){
                avrWriter.write("\tpush\tr25\n");
            }
            avrWriter.write("\tpush\tr24\n\n");
        }
    }
    
    @Override
    public void outNewExp(NewExp node){
        ClassSTE objType = (ClassSTE) symTable.lookup(node.getId());
        int objSize = objType.getScope().getOffset();
        avrWriter.write("\t#NewExp\n" + 
                        "\tldi\t\tr24, lo8("+objSize+")\n" +
                        "\tldi\t\tr25, hi8("+objSize+")\n" +
                        "\t# allocating object of size "+objSize+" on heap\n" +
                        "\tcall\tmalloc\n" +
                        "\t# push object address\n" +
                        "\t# push two byte expression onto stack\n" +
                        "\tpush\tr25\n" +
                        "\tpush\tr24\n\n");
    }
    
    @Override
    public void outThisExp(ThisLiteral node){
        avrWriter.write("\t# Pushing 'this'\n" +
                        "\tldd\t\tr31,Y+2\n" +
                        "\tldd\t\tr30,Y+1\n" +
                        "\tpush\tr31\n" +
                        "\tpush\tr30\n");
    }
    
    
    
    
    
}













