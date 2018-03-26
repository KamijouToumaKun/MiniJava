package minijava.typecheck;


public class ErrorPrinter {
    public static ErrorPrinter instance = new ErrorPrinter();
    private static int size = 0;
    public void printError(int line,int column,String content) {
        System.out.println("line:" + line + " column:" + column + '\n' + content);
        size ++;
    }
    public static int getSize() {
    	return size;
    }
}
