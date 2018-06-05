package kanga.symboltable;

import java.io.PrintStream;

public class Context {
	public static PrintStream out;

    public Context(PrintStream out) {
    	this.out = out;
    }
}