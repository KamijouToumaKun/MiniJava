class Initialization {
    public static void main(String[] args) {
        System.out.println(new A().foo());
    }
}

class A {
    public int foo() {
        int[] arr;
        int a;
        a = arr[2];
        return a;
    }
}