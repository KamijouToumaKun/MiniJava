import minijava.typecheck.PrintError;

import minijava.MiniJavaParser; //@generated by JavaCC
import minijava.ParseException; //@generated by JavaCC
import minijava.TokenMgrError; //@generated by JavaCC

import minijava.symboltable.MClassList;
import minijava.syntaxtree.Node; //@generated by JTB
import minijava.visitor.SymbolTableVisitor; 
    //在GJDepthFirst<Object, Object>的基础上，途中加入符号表，进行一部分重复检查
import minijava.visitor.TypeCheckVisitor;
    //在GJDepthFirst<Object, Object>的基础上，途中从符号表读取、进行剩下部分的类型检查

import minijava.symboltable.*; 

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;


public class Main { 
 
    public static void main(String[] args) {
    	try {
			//InputStream is = System.in;
			// InputStream is = new FileInputStream("test/BinaryTree-error.java");
            // InputStream is = new FileInputStream("test/BinaryTree.java");
            // InputStream is = new FileInputStream("test/BubbleSort-error.java");
            // InputStream is = new FileInputStream("test/BubbleSort.java");
            // InputStream is = new FileInputStream("test/Factorial-error.java");
            // InputStream is = new FileInputStream("test/Factorial.java");
            // InputStream is = new FileInputStream("test/LinearSearch-error.java");
            // InputStream is = new FileInputStream("test/LinearSearch.java");
            // InputStream is = new FileInputStream("test/LinkedList-error.java");
            // InputStream is = new FileInputStream("test/LinkedList.java");
            // InputStream is = new FileInputStream("test/MoreThan4-error.java");
            // InputStream is = new FileInputStream("test/MoreThan4.java");
            // InputStream is = new FileInputStream("test/QuickSort-error.java");
            // InputStream is = new FileInputStream("test/QuickSort.java");
            InputStream is = new FileInputStream("test/TreeVisitor-error.java");
            // InputStream is = new FileInputStream("test/TreeVisitor.java");
			
            Node root = new MiniJavaParser(is).Goal();
			root.accept(new SymbolTableVisitor(),MClassList.instance);
			root.accept(new TypeCheckVisitor(), MClassList.instance);
			if(!PrintError.hasOut) System.out.println("Program type checked successfully");
			else System.out.println("Type error");
		} catch(TokenMgrError e){
    		e.printStackTrace();
    	} catch (ParseException e){
    		e.printStackTrace();
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    }
}