main() {
  //静态属性和方法
  print(Human.humanname);
  Human.humanSleep();

  CoderMan coderMan = CoderMan('张三', 28);
  print(coderMan.PersonalInfo);
  coderMan.speakEnglish();
  coderMan.useDart();

  SuperMan superMan = SuperMan();
  superMan.rich();
  superMan.poor();
  print(superMan.name);

  DartPro dartPro = DartPro();
  dartPro.userOther();
}

class Human {
  String name;
  int age;

  //静态属性
  static String humanname = '人类';
  //静态方法
  static void humanSleep() {
    print('世人都要睡觉');
  }

  //非静态方法可以调用静态方法
  void somehumanSleep() {
    humanSleep();
  }

  Human(this.name, this.age);
}

//普通类作为接口被实现
class EnglishTeacher {
  String classname = '二级英语水平';

  speakEnglish() {
    print('英语老师会说英语');
  }
}

//抽象类作为接口被实现
abstract class DartTeacher {
  String classname = 'dart精通';

  //抽象类的构造函数 被子类继承时必须要调用super
  // String tempString;
  // DartTeacher(this.tempString);

  //抽象类方法不用方法体 没实际意义 但是这么写不会报错
  useDart();
  // useDart(){
  //   print('会dart编程');
  // }
  useFlutter();

  // userOther();//子类继承必须要override方法
  userOther() => print("userother 抽象类的方法并有方法体"); //子类继承则不需要overried改方法

}

//继承抽象类 如果抽象类的方法是已经被实现 则不需要强制overried
class DartPro extends DartTeacher {
  //继承了抽象类 需要构造函数
  // DartPro(a) : super("123");

  @override
  useDart() {
    // TODO: implement useDart
    throw UnimplementedError();
  }

  @override
  useFlutter() {
    // TODO: implement useFlutter
    throw UnimplementedError();
  }
}

//继承 构造函数不能被继承 所以每个子类都要有自己的构造函数
//实现接口 必须要实现属性以及方法 一个类可以实现多个接口
class CoderMan extends Human implements EnglishTeacher, DartTeacher {
  CoderMan(String name, int age) : super(name, age);

  String get PersonalInfo {
    return '$name今年${age}';
  }

  @override
  speakEnglish() {
    print('程序员跟英语老师学会说英语');
  }

  @override
  String classname = '程序员二级英语水平';

  @override
  useDart() {
    print('必须会dart语言');
  }

  @override
  useFlutter() {
    print('也会flutter');
  }

  @override
  userOther() {
    // TODO: implement userOther
    throw UnimplementedError();
  }
}

class RichMan {
  String name = '有钱人';

  rich() {
    print('发动有钱技能');
  }
}

class SpiderMan {
  String name = '穷比';

  poor() {
    print('穷人发动变异技能');
  }

  rich() {
    print('穷人也变有钱了');
  }
}

//通过mixins实现多继承效果 mixins既不属于继承也不是接口 是一个新特性
//mixins的类不能有构造函数 mixins的两个类同名属性和方法 谁在后面会替换前面的
class SuperMan with RichMan, SpiderMan {}
