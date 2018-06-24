package minijava.symboltable;

import minijava.typecheck.ErrorPrinter;

import java.util.ArrayList;
import java.util.HashSet;

public class MMethod extends MType {
    protected String returnType;
    protected String className;
    protected ArrayList<MVar> mParamArrayList = new ArrayList<MVar>();
    protected HashSet<MVar> mVarSet = new HashSet<MVar>();

    public String getClassName() {
        return className;
    }

    public ArrayList<MVar> getmParamArrayList() {
        return mParamArrayList;
    }

    public String getReturnType() {
        return returnType;
    }

    public MMethod(String name,String returnType,String className,int line,int column) {
        super(name,line,column);
        this.returnType = returnType;
        this.className = className;
    }

    public boolean judgeEqualParamList(ArrayList<MVar> paramList) {
        if(mParamArrayList.size() != paramList.size()) return false;
        int s = paramList.size();
        for (int i=0; i < s; i++) {
            if(!mParamArrayList.get(i).type.equals(paramList.get(i).type)) {
                return false;
            }
        }
        return true;
    }

    public boolean judgeParamList(ArrayList<MVar> paramList) {
        if (mParamArrayList.size() != paramList.size()) {
            return false;
        }
        // judge paramlist one by one
        int s = paramList.size();
        for (int i=0; i < s; i++) {
            if (!MClassList.instance.judgeParentClass(paramList.get(i).type, mParamArrayList.get(i).type)) {
                return false;
            }
        }
        return true;
    }

    public boolean repeatedParam(String paramName) {
        for (MVar knownParam:mParamArrayList) {
            if (paramName.equals(knownParam.getName())) {
                return true;
            }
        }
        return false;
    }

    public boolean addParam(MVar nParam) {
        if (repeatedParam(nParam.getName())) {
            ErrorPrinter.instance.printError(nParam.getLine(),nParam.getColumn(),"Param " + nParam.getName() + " repeated declared");
            return false;
        } else {
            mParamArrayList.add(nParam);
            return true;
        }
    }

    public boolean addVar(MVar nVar) {
        if (repeatedParam(nVar.getName())) {
            ErrorPrinter.instance.printError(nVar.getLine(),nVar.getColumn(),"Var " + nVar.getName() + " declaration conflict with param");
            return false;
        } else if (!mVarSet.add(nVar)) {
            ErrorPrinter.instance.printError(nVar.getLine(),nVar.getColumn(),"Var " + nVar.getName() + " repeated declared");
            return false;
        } else {
            return true;
        }
    }

    // no need to getParam by now

    public MVar getVar(String name) {
        for (MVar knownVar:mVarSet) {
            if (name.equals(knownVar.getName())) {
                return knownVar;
            }
        }
        for (MVar knownParam:mParamArrayList) {
            if (name.equals(knownParam.getName())) {
                return knownParam;
            }
        }
        MClass nClass = MClassList.instance.findClass(className);
        if (nClass != null) {
            return nClass.getVar(name);
        } else { //that will not happen
            return null;
        }
    }
}
