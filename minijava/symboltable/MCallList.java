package minijava.symboltable;

import java.util.ArrayList;

public class MCallList extends MType {
    protected MMethod callerMethod;
    protected MMethod contextMethod;
    protected ArrayList<MVar> mVarArrayList;

    public MCallList(MMethod callerMethod,MMethod contextMethod) {
        this.callerMethod = callerMethod;
        this.contextMethod = contextMethod;
        mVarArrayList = new ArrayList<MVar>();
    }

    public ArrayList<MVar> getmVarArrayList() {
        return mVarArrayList;
    }

    public MMethod getContextMethod() {
        return contextMethod;
    }
}
