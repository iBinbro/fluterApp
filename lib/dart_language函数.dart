void main() {
  void func() {
    print("func");
  }

  //     (){
  //   print("func"); = func
  // }

  //func直接去掉 然后()即为直接调用方法 匿名函数
      () {
    print("func");
  }();

  // =>箭头函数 相当于精简掉了 return value; 且后面跟表达式，并不能跟复杂的语句
  int arrowFunc() {
    return 1 + 2;
  }

  int arrowFunction() => 1 + 2;

  void arrowFunc2() {
    print("arrowFunc2");
  }

  void arrowFunc22() => print("arrowFunc22");

  arrowFunc2();
  arrowFunc22();

  //可选参数 可选参数必须赋初始值 否则报错
  //❌  void paraFunc(int age, [int x]){}
  void paraFunc(int age, [int x = 0]) {
    print("${age}==${x}");
  }

  paraFunc(10, 111);

  //[参数]表示可选参数 {}表示命名参数 这些参数必须有初始值
  //多个可选参数 按顺序传参 参数可传可不传
  void paraFuncxxx(int age, [int x = 0, String y = "10"]) {
    print("${age}==${x}==${y}");
  }

  paraFuncxxx(10);
  paraFuncxxx(10, 20);
  paraFuncxxx(10, 20, "30");

  //命名参数 传参可不按顺序但要指定参数名
  void printInfo2(String name, {String sex = '男', int age = 10}) {
    print(name + sex + age.toString());
  }
  printInfo2("22", age: 333, sex: "人要");
  printInfo2('33');

  //函数作为参数传递
  void paraFuncPara(String name) {
    print("paraFuncPara函数处理参数=" + name);
  }

  void runFunc(String para, Function paraFunc) {
    paraFunc(para);
  }

  runFunc("我是runFunc参数", paraFuncPara);

  // is 判断类型 c is A 表示c对象是否属于A或者A的子类。
  // 以下均会执行
  C c_objc = C();
  if (c_objc is A){
    print('c is A');
  }
  if (c_objc is B){
    print('c is B');
  }
  if (c_objc is C){
    print('c is C');
  }

  // as 一般配合try catch使用，强制类型转换，可以敲出被转换类型的属性，如果运行时类型不一致会抛出异常。
  // a被声明为 int类型，没有name属性，但是用了as就可以使用name属性，因为a实际是int，所以在这会抛出异常
  int a = 10;
  try{
    print((a as C).name);
  }catch (e){
    print(e);
  }
}

class A extends Object{

}

class B extends A{

}

class C extends B{
  String name = '只有C才有名字哦';
}