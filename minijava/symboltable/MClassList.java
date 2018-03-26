package minijava.symboltable;

import minijava.typecheck.ErrorPrinter;

import java.util.HashSet;

public class MClassList extends MType {
    public static MClassList instance = new MClassList();

    private HashSet<MClass> mClassSet = new HashSet<MClass>();

    private MClassList(){
        mClassSet.add(new MClass("int",0,0));
        mClassSet.add(new MClass("int[]",0,0));
        mClassSet.add(new MClass("boolean",0,0));
    }

    //insert a new class in the list
    public boolean addClass(MClass nClass) {
        if(!mClassSet.add(nClass)) {
            ErrorPrinter.instance.printError(nClass.getLine(),nClass.getColumn(),"Class " + nClass.getName() + " repeated declared");
            return false;
        } else {
            return true;
        }
    }

    //search a class according to name
    public MClass findClass(String name) {
        for (MClass knownClass:mClassSet) {
            if (name.equals(knownClass.getName())) {
                return knownClass;
            }
        }
        return null;
    }

    //judge whether class b is the father class of class a
    public boolean judgeParentClass(String a,String b) {
        MClass aa = MClassList.instance.findClass(a);
        while (aa != null) {
            if (aa.getName().equals(b)) {
                return true;
            }
            String parent = aa.getParentClass();
            aa = MClassList.instance.findClass(parent);
        }
        return false;
    }
}
