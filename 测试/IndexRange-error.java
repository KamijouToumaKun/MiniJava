class IndexRange {
    public static void main(String[] args) {
        System.out.println(new A().foo());
    }
}

class A {
    int o;
    public int foo() {
        int[] arr;
        int a;
        arr = new int[o+2];
        a = arr.length;
        return arr[a];
    }
}