import piglet.syntaxtree.*;
import piglet.symboltable.MSpiglet;
import piglet.ParseException;
import piglet.PigletParser;
import piglet.TokenMgrError;

import piglet.visitor.GJDepthFirst;
import piglet.visitor.Pigelet2SpigletVisitor;
import piglet.visitor.PigletTempNumVisitor;

import java.io.*;
import java.util.Scanner;


public class Main { 
    public static void main(String[] args) {
    	try {
    		// InputStream is = new FileInputStream("test/BinaryTree.pg");
            // InputStream is = new FileInputStream("test/BubbleSort.pg");
            // InputStream is = new FileInputStream("test/Factorial.pg");
            // InputStream is = new FileInputStream("test/LinearSearch.pg");
            // InputStream is = new FileInputStream("test/LinkedList.pg");
            // InputStream is = new FileInputStream("test/MoreThan4.pg");
            // InputStream is = new FileInputStream("test/QuickSort.pg");
            InputStream is = new FileInputStream("test/TreeVisitor.pg");
			PrintStream out = new PrintStream("mine.spg");
			Scanner sc = new Scanner(is);
			String spigletCode = "";
			while(sc.hasNext()) {
				spigletCode += sc.nextLine() + "\n";
			}
			out.println(pig2spig(spigletCode));
		}
    	catch(TokenMgrError e){
    		//Handle Lexical Errors
    		e.printStackTrace();
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    }
    public static String pig2spig(String s) {
        InputStream in = new ByteArrayInputStream(s.getBytes());
        Node root = new NodeToken("rr");
        try {
            root = new PigletParser(in).Goal();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        PigletTempNumVisitor v = new PigletTempNumVisitor();
        root.accept(v);
        Pigelet2SpigletVisitor t = new Pigelet2SpigletVisitor(v.getTempNum());
        return root.accept(t).getCode().toString();
    }
}