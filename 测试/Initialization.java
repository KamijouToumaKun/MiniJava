class Initialization {
    public static void main(String[] args) {
        System.out.println(new A().foo());
    }
}

class A {
    int o;
    public int echo(int a) {
        return a;
    }
    public int foo() {
        int[] arr;
        int a;
        arr = new int[5];
        a = arr[2];
        return a;
    }
}