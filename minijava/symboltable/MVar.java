package minijava.symboltable;

public class MVar extends MType {
    protected String type;
    protected boolean isParam;
    protected String methodName;
    protected String className;

    public boolean getIsParam() {
        return isParam;
    }

    public String getType() {
        return type;
    }

    public String getMethodName() {
        return methodName;
    }

    public String getClassName() {
        return className;
    }

    public MVar(String name,String type,boolean isParam,String methodName,String className,int line,int column) {
        super(name,line,column);
        this.type = type;
        this.isParam = isParam;
        this.methodName = methodName;
        this.className = className;
    }
}
