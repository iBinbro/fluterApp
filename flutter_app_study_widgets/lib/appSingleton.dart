import 'package:flutter/material.dart';

//单例的思路 重写一个默认的构造函数 并返回一个固定的变量 固定的变量引用的是 私有方法创建的对象
//默认构造函数限制了只能使用默认构造函数创建对象 私有方法确保在该单例类内部调用 固定变量

//为什么要用factory
//factory允许构造函数返回一个变量 普通构造函数是不允许有返回值的
class SingletonObj {
  //声明一个私有构造函数 用来创建单例对象
  SingletonObj._suibianla() {}

  //声明一个私有变量 并用私有的构造函数创建单例对象 来赋值
  static SingletonObj _intance = SingletonObj._suibianla();

  //默认构造函数 factory运来允许构建函数返回一个变量
  factory SingletonObj() {
    return _intance;
  }
}

class Singleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单例"),
      ),
      body: IconButton(
          onPressed: () {
            SingletonObj singletonObj = SingletonObj();
            print("创建对象 == ${singletonObj} hashcode ${singletonObj.hashCode}");
          },
          icon: Icon(Icons.add)),
    );
  }
}
