package minijava.symboltable;

public class MType {
    protected String name;
    protected int line = 0;
    protected int column = 0;

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
