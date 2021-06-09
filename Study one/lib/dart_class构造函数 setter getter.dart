main() {
  //dart语法糖 ?. ??  执行会报错
  // String a = "dart";
  // if (a?.isNotEmpty ?? false) {
  //   print('😏');
  // }
  //
  // var dog = Dog('大黄', 10);
  // //?. 如果dog为nul dog.name也会返回null ??前面不成立执行后面
  // print(dog?.name ?? '前面的值如果为null 则输出这一行');

  //类 对象
  //构造函数

  //默认构造函数 只能有一个默认构造函数 但是可以多个命名构造函数
  // Student stu = Student('小明', 12);

  //默认构造函数 但是使用了初始化列表 即属性给了初始默认值
  // Student():name='我是默认名字',age=18{
  // }
  Student stu = Student();

  //dart的setter和getter

  //getter
  print(stu.studentinfo);
  //setter
  stu.nextStudentName = '小华';
  print(stu.studentinfo);

  Student defaultBuildFunction = Student.defaultBuildFunction('小红', 15, '红红');
  print(defaultBuildFunction.studentinfo);

  Student defaultBuildFunction1 =
      Student.defaultBuildFunction1('大王', 99, '大王王');
  print(defaultBuildFunction1.studentinfo);

  Student defaultBuildFunction2 =
      Student.defaultBuildFunction2('中王', 88, '中王王');
  print(defaultBuildFunction2.studentinfo);

  Student defaultBuildFunction3 = Student.defaultBuildFunction3();
  print(defaultBuildFunction3.studentinfo);

  Student defaultBuildFunction4 = Student.defaultBuildFunction4(agePara: 8888);
  print(defaultBuildFunction4.studentinfo);

  Dog(name: "是只狗");

}

class Dog {
  var name;
  int age = 0;

  // Dog(this.name, this.age);

  //简写下 设置默认值 此时是命名参数加可选参数
  Dog({this.name, this.age: 10});
}

// 函数的 构造函数 以及 setter  getter
class Student extends Object {
  //构造函数赋值 所以这里不用初始化值
  String name;
  String nickname;
  int age;

  //私有属性
  bool _isSingle = true;

  //私有方法
  void _privateFunction() {
    print('我是私有方法');
  }

  //默认构造函数的简写
  // Student(this.name, this.age);
  // 和一下效果一样
  // Student(String name, int age){
  //   this.name = name;
  //   this.age = age;
  // }

  //默认构造函数 初始化列表 即为参数设置默认值
  Student()
      : name = '我是默认名字',
        age = 18,
        nickname = '' {
    print('初始化列表的构造函数');
  }

  //命名构造函数
  //初始化列表操作的是属性值 而不是传入的参数值
  Student.defaultBuildFunction(this.name, this.age, this.nickname);
  // =>相当于
  Student.defaultBuildFunction1(
      String namePara, int agePara, String nicknamePara)
      : this.name = namePara,
        this.age = agePara,
        this.nickname = nicknamePara {}
  // =>相当于(this 可省略)
  Student.defaultBuildFunction2(
      String namePara, int agePara, String nicknamePara)
      : name = namePara,
        age = agePara,
        nickname = nicknamePara {}

  //命名构造函数 对象的属性必须有默认值 类似一下写法现在会报错
  // Student.defaultBuildFunction2(String name, int age){
  //   this.name = name;
  //   this.age = age;
  // }

  //可选参数和命名参数所在的函数调用参数不需要都传
  //构造函数的可选参数
  Student.defaultBuildFunction3([
    String namePara = '可选namepara',
    int agePara = -999,
  ])  : this.name = namePara,
        this.age = agePara,
        this.nickname = namePara {}

  //构造函数的命名参数
  Student.defaultBuildFunction4(
      {int agePara = 10,
      String namePara = '命名参数名字',
      String nicknamePara = '命名参数外号'})
      : this.age = agePara,
        this.name = namePara,
        this.nickname = nicknamePara {}

  //getter
  String get studentinfo {
    return '$name的年龄是$age,外号是${nickname}';
  }

  // setter
  set nextStudentName(String name) {
    this.name = name;
    this.age = age;
  }
}
