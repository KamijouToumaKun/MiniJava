package minijava.typecheck;


public class PrintError {
    public static PrintError instance = new PrintError();
    public static boolean hasOut = false;
    public void printError(int line,int column,String content) {
        System.out.println("line:" + line + " column:" + column + '\n' + content);
        hasOut = true;
    }
}
