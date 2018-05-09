class AD {
    public static void main(String[] args) {
        System.out.println(new C().fun());
    }
}

class A {
	int age;
	public boolean setAge(){
		age = 10;
		return true;
	}
	public int getAge(){
		return age;
	}
	public int foo() {
		return 0;
	}
}

class B extends A{
	int age;
	public int foo() {
		boolean flag;
		flag = this.setAge();
		return this.getAge();
	}
}

class C{
	public int fun(){
		A b;
		int ans;
		b = new B();
		ans = b.foo();
		return ans; 
	}
}