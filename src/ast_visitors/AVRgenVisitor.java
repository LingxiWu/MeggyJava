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
                        "\tpop\tr26\n" +
                        "\ttst\tr26\n" +
                        "\tbrlt\t"+ifNegative+"\n" +
                        "\tldi\tr27, 0\n" +
                        "\tjmp\t"+elsPositive+"\n" +
                        ifNegative+":\n" +
                        "\tldi\tr27, hi8(-1)\n" +
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
				"\tpop\tr20\n" +
				"\t# load a one byte expression off stack\n" +
				"\tpop\tr22\n" +
				"\t# load a one byte expression off stack\n" +
				"\tpop\tr24\n" +
				"\tcall\t_Z6DrawPxhhh\n" +
				"\tcall\t_Z12DisplaySlatev\n\n");
	}
    
    @Override
    public void outMeggyDelay(MeggyDelay node){
        avrWriter.write("\t### Meggy.delay() call\n" +
                        "\t# load delay parameter\n" +
                        "\t# load a two byte expression off stack\n" +
                        "\tpop\tr24\n" +
                        "\tpop\tr25\n" +
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
                        "\tpop\tr24\n" +
                        "\t#load zero into reg\n" +
                        "\tldi\tr25, 0\n" +
                        "\t#use cp to set SREG\n" +
                        "\tcp\tr24, r25\n" +
                        "\t#WANT breq "+elseLabel+"\n" +
                        "\tbrne\t"+thenLabel+"\n" +
                        "\tjmp\t"+elseLabel+"\n\n" +
                        "# then label for if\n" +
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
                        "\tpop\tr24\n" +
                        "\tldi\tr25,0\n" +
                        "\tcp\tr24, r25\n" +
                        "\t# WANT breq "+endLabel+"\n" +
                        "\tbrne\t"+bodyLabel+"\n" +
                        "\tjmp\t"+endLabel+"\n\n" +
                        "\t# while loop body\n" +
                        bodyLabel+":\n");
        if(node.getStatement() != null)
        {
            node.getStatement().accept(this);
        }
        avrWriter.write("\t# jump to while test\n" +
                        "jmp\t"+whileStart+"\n\n" +
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
                        "\tpop\tr24\n" +
                        "\tpop\tr25\n" +
                        "\tldi\tr22, 0\n" +
                        "\tldi\tr23, 0\n" +
                        "\tsub\tr22, r24\n" +
                        "\tsbc\tr23, r25\n" +
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
                        "\tpop\tr18\n" +
                        "\tpop\tr19\n");
        if (symTable.getExpType(node.getLExp()) == Type.BYTE){
            promoteByteToInt();
        }
        avrWriter.write("\t# load an int off stack\n" +
                        "\tpop\tr24\n" +
                        "\tpop\tr25\n");
        avrWriter.write("\t# Do add operation\n" +
                        "\tadd\tr24, r18\n" +
                        "\tadc\tr25, r19\n" +
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
                        "\tpop\tr18\n" +
                        "\tpop\tr19\n");
        if (symTable.getExpType(node.getLExp()) == Type.BYTE){
            promoteByteToInt();
        }
        avrWriter.write("\t# load an int off stack\n" +
                        "\tpop\tr24\n" +
                        "\tpop\tr25\n");
        avrWriter.write("\t# Do subtraction operation\n" +
                        "\tsub\tr24, r18\n" +
                        "\tsbc\tr25, r19\n" +
                        "\t# push two byte expression onto stack\n" +
                        "\tpush\tr25\n" +
                        "\tpush\tr24\n\n");
    }
    
    @Override
    public void outMulExp(MulExp node){
        avrWriter.write("\t# Multiplication (BYTE x BYTE ONLY! Returns int)\n" +
                        "\t# load a byte off stack\n" +
                        "\tpop\tr18\n" +
                        "\t# load a byte off stack\n" +
                        "\tpop\tr22\n" +
                        "\t# move one byte src into dest reg\n" +
                        "\tmov\tr24, r18\n" +
                        "\t# move one byte src into dest reg\n" +
                        "\tmov\tr26, r22\n" +
                        "\t# Do mul operation of two input bytes\n" +
                        "\tmuls\tr24, r26\n" +
                        "\t# push two-byte expression onto stack\n" +
                        "\tpush\tr1\n" +
                        "\tpush\tr0\n" +
                        "\t# clear r0 and r1\n" +
                        "\teor\tr0,r0\n" +
                        "\teor\tr1,r1\n\n");
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
                        "\tpop\tr24\n" +
                        "\t# compare left exp with zero\n" +
                        "\tldi r25, 0\n" +
                        "\tcp\tr24, r25\n" +
                        "\t# Want this, breq "+noREval+"\n" +
                        "\tbrne\t"+doREval+"\n" +
                        "\t# We're skipping right exp, so push left val (false) for eval\n" +
                        "\tpush\tr24\n" +
                        "\tjmp\t"+noREval+"\n\n" +
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
                        "\tpop\tr18\n" +
                        "\tpop\tr19\n");
        if (symTable.getExpType(node.getLExp()) != Type.INT){
            promoteByteToInt();
        }
        String resultFalse = getNextLabel();
        String resultTrue = getNextLabel();
        String storeResult = getNextLabel();
        avrWriter.write("\t# load a two-byte expression off stack\n" +
                        "\tpop\tr24\n" +
                        "\tpop\tr25\n" +
                        "\tcp\tr24, r18\n" +
                        "\tcpc\tr25, r19\n" +
                        "\tbreq\t"+resultTrue+"\n" +
                        "\t# result is false\n" +
                        resultFalse+":\n" +
                        "\tldi\tr24, 0\n" +
                        "\tjmp\t"+storeResult+"\n" +
                        "\t# result is true\n" +
                        resultTrue+":\n" +
                        "\tldi\tr24, 1\n" +
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
						"\tpop\tr24\n"+
						"\tpop\tr25\n"+
						"\tpush\tr24\n\n");
	}
	
	@Override
	public void outIntegerExp(IntLiteral node){
		int iValue = node.getIntValue();
	    avrWriter.write("\t# Load constant int "+iValue+"\n"+
	    				 "\tldi\tr24,lo8("+iValue+")\n"+
	    				 "\tldi\tr25,hi8("+iValue+")\n"+
	    				 "\t# push two byte expression onto stack\n"+
	    				 "\tpush\tr25\n"+
	    				 "\tpush\tr24\n\n");
	}
	
	@Override
	public void outColorExp(ColorLiteral node){
		avrWriter.write("\t# Color expression "+node.getLexeme()+"\n"+
                        "\t# load a one byte expression off stack\n"+
						"\tldi\tr22,"+node.getIntValue()+"\n"+
						"\t# load a one byte expression off stack\n"+
					    "\tpush\tr22\n\n");

	}
    
    @Override
    public void outButtonExp(ButtonLiteral node){
        avrWriter.write("\t# Button expression "+node.getLexeme()+"\n"+
                        "\tldi\tr22,"+node.getIntValue()+"\n"+
                        "\t# push onto stack as single byte\n"+
                        "\tpush\tr22\n\n");
    }
    
    @Override
    public void outFalseExp(FalseLiteral node){
        avrWriter.write("\t# False literal\n"+
                        "\tldi\tr22,"+node.getIntValue()+"\n"+
                        "\t# push onto stack as single byte\n"+
                        "\tpush\tr22\n\n");
    }
    
    @Override
    public void outTrueExp(TrueLiteral node){
        avrWriter.write("\t# True/1 expression\n"+
                        "\tldi\tr22,"+node.getIntValue()+"\n"+
                        "\t# push onto stack as single byte\n"+
                        "\tpush\tr22\n\n");
    }
    
    @Override
    public void outNotExp(NotExp node){
        avrWriter.write("\t# not operation\n"+
                        "\t# load a one byte expression off stack\n"+
                        "\tpop\tr24\n"+
                        "\tldi\tr22, 1\n"+
                        "\teor\tr24,r22\n"+
                        "\t# push one byte expression onto stack\n"+
                        "\tpush\tr24\n\n");
    }
    
    @Override
    public void outMeggyGetPixel(MeggyGetPixel node){
        avrWriter.write("### Meggy.getPixel(x,y) call\n"+
                        "\t# load a one byte expression off stack\n"+
                        "\tpop\tr22\n"+
                        "\t# load a one byte expression off stack\n"+
                        "\tpop\tr24\n"+
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
                        "\tlds\tr24, "+button_name+"\n" +
                        "\tpush\tr24\n\n");
    }
	
	@Override
	public void outIdLiteral(IdLiteral node){
		avrWriter.write("\t# Id exp:\n" +
				"\t# load into register using base,offset\n" +
				"\t# push onto stack\n");
/*		System.out.println("About to do lookup: AVRgenVisitor.outIdLiteral");//debug
		VarSTE localVar = (VarSTE) this.symTable.lookup(node.getLexeme());
//		System.out.println("var is "+localVar);
		int offset = localVar.getOffset();
//		System.out.println("Offset = "+offset);
		String base = null;
		switch (localVar.getBase()){
			case CLASS: base = "Z"; break;
			case LOCAL: base = "Y"; break;
			default: assert false;
		}
//		System.out.println("Var type is "+localVar.getType());
//		System.out.println("Var size is "+localVar.getType().getAVRTypeSize());
		if (localVar.getType().getAVRTypeSize() == 2){
			avrWriter.write("\tldd\tr24, "+base+"+"+(offset+1)+"\n" +
				"\tpush\tr24\n");
		}
		avrWriter.write("\tldd\tr24, "+base+"+"+offset+"\n" +
			"\tpush\tr24\n");*/
	}
}













