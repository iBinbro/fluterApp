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
}
