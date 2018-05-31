package spiglet.symboltable;

import java.util.HashMap;

public class Method {
	public String methodName;
	public int paramNum, stackNum = 0, callParamNum = 0;

	// t0-t9
	public HashMap<String, String> regT = new HashMap<String, String>();
	// s0-s7
	public HashMap<String, String> regS = new HashMap<String, String>();
	// SPILLEDARG *
	public HashMap<String, String> regSpilled = new HashMap<String, String>();
	// tempNo -> Interval
	public HashMap<Integer, LiveInterval> mTemp = new HashMap<Integer, LiveInterval>();

	public FlowGraph flowGraph = new FlowGraph();

	public Method(String methodName, int paramNum) {
		this.methodName = methodName;
		this.paramNum = paramNum;
	}

	public String getGlobalLabel(String labelName) {
		return this.methodName + "_" + labelName;
		//like L2_QS_Sort
		//in spiglet, labels can be local and they may be not like "L2"
	}

	// tempName->regName
	// if spilled, load tempName in regName
	public String temp2Reg(String regName, String tempName) {
		if (this.regT.containsKey(tempName)) {
			return this.regT.get(tempName);
		} else if (this.regS.containsKey(tempName)) {
			return this.regS.get(tempName);
		} else {
			/*
			System.out.println("*****" + tempName);
			for (String i : this.regT.keySet())
				System.out.println("****" + i);
			for (String i : this.regS.keySet())
				System.out.println("***" + i);
			for (String i : this.regSpilled.keySet())
				System.out.println("**" + i);
			*/
			// spilled
			Context.out.printf("\t\tALOAD %s %s\n", regName, this.regSpilled.get(tempName));
			return regName;
		}
	}

	// MOVE tempName exp
	// if spilled, store in regSpilled
	public void moveToTemp(String tempName, String exp) {
		if (this.regSpilled.containsKey(tempName)) {
			Context.out.printf("\t\tMOVE v0 %s\n", exp);
			Context.out.printf("\t\tASTORE %s v0\n", this.regSpilled.get(tempName));
		} else {
			tempName = temp2Reg("", tempName);
			if (!tempName.equals(exp))
				Context.out.printf("\t\tMOVE %s %s\n", tempName, exp);
		}
	}

}
