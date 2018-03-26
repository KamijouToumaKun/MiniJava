package minijava.symboltable;

import minijava.typecheck.ErrorPrinter;

import java.util.HashSet;
import java.util.ArrayList;

public class MClass extends MType {

    protected HashSet<MMethod> mMethodSet = new HashSet<MMethod>();
    protected HashSet<MVar> mVarSet = new HashSet<MVar>();
    protected String parentClass;

    public MClass(String name,int line,int column) {
        super(name,line,column);
    }

    public String getParentClass() {
        return parentClass;
    }

    public void setParentClass(String parentClass) {
        this.parentClass = parentClass;
    }

    public HashSet<MMethod> getMethodSet() {
        return mMethodSet;
    }

    public HashSet<MVar> getVarSet() {
        return mVarSet;
    }

    public boolean repeatedMethod(String methodName,String returnType,ArrayList<MVar> paramList) {
        MClass nClass = this;
        MMethod nMethod = this.getMethod(methodName);
        //there will be no circle extension here
        while (true) {
            for (MMethod knownMethod:nClass.getMethodSet()) {
                if (methodName.equals(knownMethod.getName())) {
                    if (!knownMethod.judgeEqualParamList(paramList) || !returnType.equals(knownMethod.getReturnType())) {
                        //method name equal but param not equal
                        ErrorPrinter.instance.printError(nMethod.getLine(), nMethod.getColumn(), "Method " + nMethod.getName() + " repeated declared");
                        return true;
                    }
                }
            }
            if(nClass.getParentClass() != null) {
                nClass = MClassList.instance.findClass(nClass.getParentClass());
            }
            else {
                break;
            }
        }
        return false;
    }

    public boolean addMethod(MMethod nMethod) {
        if (!mMethodSet.add(nMethod)) {
            ErrorPrinter.instance.printError(nMethod.getLine(),nMethod.getColumn(),"Method " + nMethod.getName() + " repeated declared");
            return false;
        } else {
            return true;
        }
    }

    public boolean addVar(MVar nVar) {
        if (!mVarSet.add(nVar)) {
            ErrorPrinter.instance.printError(nVar.getLine(),nVar.getColumn(),"Var " + nVar.getName() + " repeated declared");
            return false;
        } else {
            return true;
        }
    }

    //get a method object according to its name and paramList
    public MMethod getMethod(String name) {
        MClass nClass = this;
        //there will be no circle extension here
        while (true) {
            for (MMethod knownMethod:nClass.getMethodSet()) {
                if (name.equals(knownMethod.getName())) {
                    return knownMethod;
                }
            }
            if(nClass.getParentClass() != null) {
                nClass = MClassList.instance.findClass(nClass.getParentClass());
            }
            else {
                break;
            }
        }
        return null;
    }

    public MVar getVar(String name) {
        MClass nClass = this;
        //there will be no circle extension here
        while (true) {
            for (MVar knownVar:nClass.getVarSet()) {
                if (name.equals(knownVar.getName())) return knownVar;
            }
            if (nClass.getParentClass() != null) {
                nClass = MClassList.instance.findClass(nClass.getParentClass());
            }
            else {
                break;
            }
        }
        return null;
    }
}
