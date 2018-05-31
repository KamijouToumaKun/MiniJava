package spiglet.visitor;

import java.util.Vector;
import java.util.Enumeration;
import spiglet.syntaxtree.*;
import spiglet.symboltable.Context;
import spiglet.symboltable.Method;

public class Spiglet2KangaVisitor extends GJDepthFirst<String, Method> {
	//
	// Auto class visitors--probably don't need to be overridden.
	//
	public String visit(NodeList n, Method argu) {
		String _ret=null;
		int _count=0;
		for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
			e.nextElement().accept(this, argu);
			_count++;
		}
		return _ret;
	}

	public String visit(NodeListOptional n, Method argu) {
		if ( n.present() ) {
			String _ret=null;
			int _count=0;
			for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
				e.nextElement().accept(this, argu);
				_count++;
			}
			return _ret;
		}
		else
			return null;
	}

	public String visit(NodeOptional n, Method argu) {
		/*if ( n.present() )
			return n.node.accept(this, argu);
		else
			return null;*/
		if ( n.present() ) // print new label
			Context.out.print(argu.getGlobalLabel(n.node.accept(this, argu)));
		return null;
	}

	public String visit(NodeSequence n, Method argu) {
		String _ret=null;
		int _count=0;
		for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
			e.nextElement().accept(this, argu);
			_count++;
		}
		return _ret;
	}

	public String visit(NodeToken n, Method argu) { return null; }

	//
	// User-generated visitor methods below
	//

	/**
	 * f0 -> "MAIN"
	 * f1 -> StmtList()
	 * f2 -> "END"
	 * f3 -> ( Procedure() )*
	 * f4 -> <EOF>
	 */
	public String visit(Goal n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		Method currMethod = Context.mMethod.get("MAIN");
		Context.out.printf("MAIN [%d][%d][%d]\n", currMethod.paramNum, currMethod.stackNum, currMethod.callParamNum);
		n.f1.accept(this, currMethod);//inside a method
		n.f2.accept(this, currMethod);//inside a method
		Context.out.println("END");
		n.f3.accept(this, argu);
		n.f4.accept(this, argu);
		return _ret;//null
	}

	/**
	 * f0 -> ( ( Label() )? Stmt() )*
	 */
	public String visit(StmtList n, Method argu) {
	    String _ret=null;
	    n.f0.accept(this, argu);
	    return _ret;
	}

	/**
	 * f0 -> Label()
	 * f1 -> "["
	 * f2 -> IntegerLiteral()
	 * f3 -> "]"
	 * f4 -> StmtExp()
	 */
	public String visit(Procedure n, Method argu) {
		String _ret=null;

		String methodName = n.f0.accept(this, argu);
		Method currMethod = Context.mMethod.get(methodName);//inside a method
		Context.out.printf("\n%s [%d][%d][%d]\n", methodName, currMethod.paramNum, currMethod.stackNum,
				currMethod.callParamNum);
		n.f1.accept(this, currMethod);//inside a method
		n.f2.accept(this, currMethod);//but don't need its value
		n.f3.accept(this, currMethod);//inside a method
		n.f4.accept(this, currMethod);//inside a method
		return _ret;//null
	}

	/**
	 * f0 -> "NOOP"
	 */
	public String visit(NoOpStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);
		Context.out.println("\t\tNOOP");
		return _ret;//null
	}

	/**
	 * f0 -> "ERROR"
	 */
	public String visit(ErrorStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);
		Context.out.println("\t\tERROR");
		return _ret;//null
	}

	/**
	 * f0 -> "CJUMP"
	 * f1 -> Temp()
	 * f2 -> Label()
	 */
	public String visit(CJumpStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		Context.out.printf("\t\tCJUMP %s %s\n", 
			argu.temp2Reg("v0", n.f1.accept(this, argu)), 
			argu.getGlobalLabel(n.f2.accept(this, argu)));
		return _ret;
	}

	/**
	 * f0 -> "JUMP"
	 * f1 -> Label()
	 */
	public String visit(JumpStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		Context.out.printf("\t\tJUMP %s\n", argu.getGlobalLabel(n.f1.accept(this, argu)));
		return _ret;//null
	}

	/**
	 * f0 -> "HSTORE"
	 * f1 -> Temp()
	 * f2 -> IntegerLiteral()
	 * f3 -> Temp()
	 */
	public String visit(HStoreStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		Context.out.printf("\t\tHSTORE %s %s %s\n", 
			argu.temp2Reg("v0", n.f1.accept(this, argu)), 
			n.f2.accept(this, argu),
			argu.temp2Reg("v1", n.f3.accept(this, argu)));
		return _ret;//null
	}

	/**
	 * f0 -> "HLOAD"
	 * f1 -> Temp()
	 * f2 -> Temp()
	 * f3 -> IntegerLiteral()
	 */
	public String visit(HLoadStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		String tempTo = n.f1.accept(this, argu);
		String regFrom = argu.temp2Reg("v1", n.f2.accept(this, argu));
		String offset = n.f3.accept(this, argu);
		if (argu.regSpilled.containsKey(tempTo)) {
			Context.out.printf("\t\tHLOAD v1 %s %s\n", regFrom, offset);
			argu.moveToTemp(tempTo, "v1");
		} else {
			Context.out.printf("\t\tHLOAD %s %s %s\n", argu.temp2Reg("", tempTo), regFrom, offset);
		}
		return _ret;//null
	}

	/**
	 * f0 -> "MOVE"
	 * f1 -> Temp()
	 * f2 -> Exp()
	 */
	public String visit(MoveStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		String temp = n.f1.accept(this, argu);
		String exp = n.f2.accept(this, argu);
		argu.moveToTemp(temp, exp);
		return _ret;//null
	}

	/**
	 * f0 -> "PRINT"
	 * f1 -> SimpleExp()
	 */
	public String visit(PrintStmt n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		String simpleExp = n.f1.accept(this, argu);
		Context.out.printf("\t\tPRINT %s\n", simpleExp);
		return _ret;//null
	}

	/**
	 * f0 -> Call() | HAllocate() | BinOp() | SimpleExp()
	 */
	public String visit(Exp n, Method argu) {
		String _ret = n.f0.accept(this, argu);
		return _ret;
	}

	/**
	 * f0 -> "BEGIN"
	 * f1 -> StmtList()
	 * f2 -> "RETURN"
	 * f3 -> SimpleExp()
	 * f4 -> "END"
	 */
	public String visit(StmtExp n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		int stackIdx = argu.paramNum > 4 ? argu.paramNum - 4 : 0;
		// store callee-saved S
		if (argu.regS.size() != 0) {
			for (int idx = stackIdx; idx < stackIdx + argu.regS.size(); idx++) {
				if (idx - stackIdx > 7) {
					break;
				}
				Context.out.println("\t\tASTORE SPILLEDARG " + idx + " s" + (idx - stackIdx));
			}
		}
		// move params regA to TEMP
		for (stackIdx = 0; stackIdx < argu.paramNum && stackIdx < 4; stackIdx++)
			if (argu.mTemp.containsKey(stackIdx))
				argu.moveToTemp("TEMP " + stackIdx, "a" + stackIdx);
		// load params(>4)
		for (; stackIdx < argu.paramNum; stackIdx++) {
			String tempName = "TEMP " + stackIdx;
			if (argu.mTemp.containsKey(stackIdx)) {
				if (argu.regSpilled.containsKey(tempName)) {
					Context.out.printf("\t\tALOAD v0 SPILLEDARG %d\n", stackIdx - 4);
					argu.moveToTemp(tempName, "v0");
				} else {
					Context.out.printf("\t\tALOAD %s SPILLEDARG %d\n", argu.temp2Reg("", tempName), stackIdx - 4);
				}
			}
		}

		n.f1.accept(this, argu);
		n.f2.accept(this, argu);
		// v0 stores returnValue
		Context.out.println("\t\tMOVE v0 " + n.f3.accept(this, argu));

		// restore callee-saved S
		stackIdx = argu.paramNum > 4 ? argu.paramNum - 4 : 0;
		if (argu.regS.size() != 0) {
			for (int j = stackIdx; j < stackIdx + argu.regS.size(); j++) {
				if (j - stackIdx > 7)
					break;
				Context.out.println("\t\tALOAD s" + (j - stackIdx) + " SPILLEDARG " + j);
			}
		}

		n.f4.accept(this, argu);
		Context.out.println("END");
		return _ret;//null
	}

	/**
	 * f0 -> "CALL"
	 * f1 -> SimpleExp()
	 * f2 -> "("
	 * f3 -> ( Temp() )*
	 * f4 -> ")"
	 */
	public String visit(Call n, Method argu) {
		String _ret=null;

		n.f0.accept(this, argu);

		//don't use n.f3.accept(this, argu);
		Vector<Node> vTemp = n.f3.nodes;//NodeListOptional.nodes
		int nParam = vTemp.size();
		int paramIdx;
		// pass params
		for (paramIdx = 0; paramIdx < nParam && paramIdx < 4; paramIdx++)
			Context.out.printf("\t\tMOVE a%d %s\n", paramIdx, argu.temp2Reg("v0", vTemp.get(paramIdx).accept(this, argu)));
		for (; paramIdx < nParam; paramIdx++)
			Context.out.printf("\t\tPASSARG %d %s\n", paramIdx - 3, argu.temp2Reg("v0", vTemp.get(paramIdx).accept(this, argu)));
		// call
		Context.out.printf("\t\tCALL %s\n", n.f1.accept(this, argu));

		n.f2.accept(this, argu);
		n.f4.accept(this, argu);
		return "v0";
	}

	/**
	 * f0 -> "HALLOCATE"
	 * f1 -> SimpleExp()
	 */
	public String visit(HAllocate n, Method argu) {
		String _ret = "HALLOCATE ";
		n.f0.accept(this, argu);
		_ret += n.f1.accept(this, argu);
		return _ret;
	}

	/**
	 * f0 -> Operator()
	 * f1 -> Temp()
	 * f2 -> SimpleExp()
	 */
	public String visit(BinOp n, Method argu) {
		String _ret = n.f0.accept(this, argu) + " ";
		_ret += argu.temp2Reg("v0", n.f1.accept(this, argu)) + " ";
		_ret += n.f2.accept(this, argu);
		return _ret;
	}

	/**
	 * f0 -> "LT" | "PLUS" | "MINUS" | "TIMES"
	 */
	public String visit(Operator n, Method argu) {
		String _ret = ((NodeToken)n.f0.choice).tokenImage;
		n.f0.accept(this, argu);
		return _ret;
	}

	/**
	 * f0 -> Temp() | IntegerLiteral() | Label()
	 */
	public String visit(SimpleExp n, Method argu) {
		String _ret=null;

		String simpleExp = n.f0.accept(this, argu);
		if (n.f0.which == 0) {
			_ret = argu.temp2Reg("v1", simpleExp);
		} else {
			_ret = simpleExp;
		}
		return _ret;
	}

	/**
	 * f0 -> "TEMP"
	 * f1 -> IntegerLiteral()
	 */
	public String visit(Temp n, Method argu) {
		String _ret = "TEMP ";
		n.f0.accept(this, argu);
		_ret += n.f1.accept(this, argu);
		return _ret;
	}

	/**
	 * f0 -> <INTEGER_LITERAL>
	 */
	public String visit(IntegerLiteral n, Method argu) {
		String _ret = n.f0.tokenImage;
		n.f0.accept(this, argu);
		return _ret;
	}

	/**
	 * f0 -> <IDENTIFIER>
	 */
	public String visit(Label n, Method argu) {
		String _ret = n.f0.tokenImage;
		n.f0.accept(this, argu);
		return _ret;
	}

}
