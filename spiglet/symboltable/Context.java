package spiglet.symboltable;

import java.util.HashMap;
import java.io.PrintStream;

public class Context {
	public static HashMap<String, Method> mMethod;
    public static HashMap<String, Integer> mLabel;
    public static PrintStream out;

    public Context(PrintStream out) {
    	mMethod = new HashMap<String, Method>();
    	mLabel = new HashMap<String, Integer>();
    	this.out = out;
    }
}