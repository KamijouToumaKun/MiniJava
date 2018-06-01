package spiglet.symboltable;

import java.util.HashMap;

import spiglet.symboltable.Context;

public class Method {
	public String methodName;
	public int paramNum, stackNum = 0, callParamNum = 0;

	// s0-s7
	public HashMap<String, String> regS = new HashMap<String, String>();
	// t0-t9
	public HashMap<String, String> regT = new HashMap<String, String>();
	// SPILLEDARG *
	public HashMap<String, String> regSpilled = new HashMap<String, String>();
	// tempNo -> Interval
	public HashMap<Integer, LiveInterval> mTemp = new HashMap<Integer, LiveInterval>();

	public FlowGraph flowGraph = new FlowGraph();

	public Method(String methodName, int paramNum) {
		this.methodName = methodName;
		this.paramNum = paramNum;
	}

	public String getGlobalLabel(String localLabel) {
		String methodAndLocalLabel = methodName + "_" + localLabel;
		//like L2_QS_Sort
		//in spiglet, labels can be local and they may be not like "L2"
		Integer globalLabelNo;
		if (Context.mGlobalLabel.containsKey(methodAndLocalLabel)) {
			globalLabelNo = Context.mGlobalLabel.get(methodAndLocalLabel);
		} else {
			globalLabelNo = Context.globalLabelNo++;
			Context.mGlobalLabel.put(methodAndLocalLabel, globalLabelNo);
		}
		return "L" + globalLabelNo;
	}

	// tempName->regName
	// if spilled, load tempName in regName
	public String temp2Reg(String regName, String tempName) {
		if (regT.containsKey(tempName)) {
			return regT.get(tempName);
		} else if (regS.containsKey(tempName)) {
			return regS.get(tempName);
		} else {
			// spilled
			Context.out.printf("\tALOAD %s %s\n", regName, regSpilled.get(tempName));
			return regName;
		}
	}

	// MOVE tempName exp
	// if spilled, store in regSpilled
	public void moveToTemp(String tempName, String exp) {
		if (regSpilled.containsKey(tempName)) {
			Context.out.printf("\tMOVE v0 %s\n", exp);
			Context.out.printf("\tASTORE %s v0\n", this.regSpilled.get(tempName));
		} else {
			tempName = temp2Reg("", tempName);
			if (!tempName.equals(exp))
				Context.out.printf("\tMOVE %s %s\n", tempName, exp);
		}
	}

}
