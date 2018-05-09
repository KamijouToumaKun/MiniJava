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
		boolean flag;
		flag = this.setAge();
		return this.getAge();
	}
}

class B extends A{
	int age;
	public boolean setAge(){
		age = 20;
		return true;
	}
	public int getAge(){
		return age;
	}
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
		b = new A();
		ans = b.foo();
		return ans; 
	}
}