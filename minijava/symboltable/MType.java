package minijava.symboltable;

public class MType {
    protected String name;
    protected int line = 0;
    protected int column = 0;

    protected int hasInitLength = 0;
    // 0: has initialized, but not sure of value
    // -1: has not initialized
    // 1: has initialized, and sure of value
    protected int length;
    public int getHasInitLength() {
        return hasInitLength;
    }
    public void setHasInitLength(int hasInitLength) {
        this.hasInitLength = hasInitLength;
    }
    public int getLength() {
        return length;
    }
    public void setLength(int length) {
        this.length = length;
    }

    protected int hasInit = 0;
    // 0: has initialized, but not sure of value
    // -1: has not initialized
    // 1: has initialized, and sure of value
    protected int intValue;
    protected boolean booleanValue;
    public int getHasInit() {
        return hasInit;
    }
    public void setHasInit(int hasInit) {
        this.hasInit = hasInit;
    }
    public void setIntValue(int intValue) {
        this.intValue = intValue;
    }
    public void setBooleanValue(boolean booleanValue) {
        this.booleanValue = booleanValue;
    }
    public int getIntValue() {
        return intValue;
    }
    public boolean getBooleanValue() {
        return booleanValue;
    }

    public MType() {
        
    }

    @Override
    public boolean equals(Object obj) {  
        if (!(obj instanceof MType)) {
            return false;
        } else {
            return name.equals(((MType)obj).name);  
        }
    }  
    @Override
    public int hashCode() {  
        return name.hashCode();  
    }  

    public MType(String name, int line, int column) {
        this.name = name;
        this.line = line;
        this.column = column;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }
}
