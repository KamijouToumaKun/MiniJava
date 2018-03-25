package minijava.symboltable;

import minijava.typecheck.PrintError;

import java.util.ArrayList;

public class MMethod extends MType {
    protected String returnType;
    protected String className;
    protected ArrayList<MVar> mParamArrayList = new ArrayList<MVar>();
    protected ArrayList<MVar> mVarArrayList = new ArrayList<MVar>();

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
        for(int i=0; i < s; i++) {
            if(!mParamArrayList.get(i).type.equals(paramList.get(i).type)) return false;
        }
        return true;
    }

    public boolean judgeParamList(ArrayList<MVar> paramList) {
        if(mParamArrayList.size() != paramList.size()) return false;
        int s = paramList.size();
        for(int i=0; i < s; i++) {
            if(!MClassList.instance.judgeParentClass(paramList.get(i).type, mParamArrayList.get(i).type)) return false;
        }
        return true;
    }

    public boolean repeatedParam(String paramName) {
        int s = mParamArrayList.size();
        for(int i = 0; i < s; i++) {
            String ithName = mParamArrayList.get(i).getName();
            if(paramName.equals(ithName)) return true;
        }
        return false;
    }

    public boolean addParam(MVar nParam) {
        if(repeatedParam(nParam.getName())) {
            PrintError.instance.printError(nParam.getLine(),nParam.getColumn(),"Param " + nParam.getName() + " repeated declared");
            return false;
        }
        mParamArrayList.add(nParam);
        return true;
    }

    public boolean repeatedVar(String varName) {
        int s = mVarArrayList.size();
        for(int i = 0; i < s; i++) {
            String ithName = mVarArrayList.get(i).getName();
            if(varName.equals(ithName)) return true;
        }
        s = mParamArrayList.size();
        for(int i = 0;i < s; i++) {
            String ithName = mParamArrayList.get(i).getName();
            if(varName.equals(ithName)) return true;
        }
        return false;
    }

    public boolean addVar(MVar nVar) {
        if(repeatedVar(nVar.getName())) {
            PrintError.instance.printError(nVar.getLine(),nVar.getColumn(),"Var " + nVar.getName() + " repeated declared");
            return false;
        }
        mVarArrayList.add(nVar);
        return true;
    }

    public MVar getVar(String name) {
        int s = mVarArrayList.size();
        for(int i = 0; i < s; i++) {
            if(mVarArrayList.get(i).getName().equals(name)) {
                return mVarArrayList.get(i);
            }
        }
        s = mParamArrayList.size();
        for(int i = 0; i < s; i++) {
            if(mParamArrayList.get(i).getName().equals(name)) {
                return mParamArrayList.get(i);
            }
        }
        MClass nClass = MClassList.instance.findClass(className);
        return nClass.getVar(name);
    }

    public int allocTemp(int currentTemp) {
        int num = 0;
        for(MVar mVar : mParamArrayList) {
            mVar.setTempNum(++num);
        }
        for(MVar mVar : mVarArrayList) {
            mVar.setTempNum(currentTemp++);
        }
        return currentTemp;
    }
}
