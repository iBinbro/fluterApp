import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// //国际化
// return GetMaterialApp(
// .......
// .......
//设置默认主题 深色主题 通过 Get.changeThemeMode 直接来切换
// theme: appLightThemeData,
// darkTheme: appDarkThemeData,

//创建Dark ThemeData对象
final ThemeData appDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  primaryColor: Colors.red, // 主要部分背景颜色（导航和tabBar等）
  scaffoldBackgroundColor:
      Colors.green, //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
  textTheme: TextTheme(headline1: TextStyle(color: Colors.yellow)),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.yellow),
  ),
  iconTheme: IconThemeData(color: Colors.blue),
);

//创建light ThemeData对象
final ThemeData appLightThemeData = ThemeData(
    brightness: Brightness.light,
    highlightColor: Colors.red,
    splashColor: Colors.red,
    primaryColor: Colors.white, // 主要部分背景颜色（导航和tabBar等）
    scaffoldBackgroundColor:
        Colors.white, //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
    textTheme: TextTheme(headline1: TextStyle(color: Colors.blue)),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.red),
    ),
    //TextButton 全局样式
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent))),
    // OutlinedButton
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      //定义文本的样式 这里设置的颜色是不起作用的
      // textStyle:
      //     MaterialStateProperty.all(TextStyle(fontSize: 18, color: Colors.red)),
      //设置按钮上字体与图标的颜色
      //foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
      //更优美的方式来设置
      // foregroundColor: MaterialStateProperty.resolveWith(
      //   (states) {
      //     if (states.contains(MaterialState.focused) &&
      //         !states.contains(MaterialState.pressed)) {
      //       //获取焦点时的颜色
      //       return Colors.blue;
      //     } else if (states.contains(MaterialState.pressed)) {
      //       //按下时的颜色
      //       return Colors.deepPurple;
      //     }
      //     //默认状态使用灰色
      //     return Colors.grey;
      //   },
      // ),
      // //背景颜色
      // backgroundColor: MaterialStateProperty.resolveWith((states) {
      //   //设置按下时的背景颜色
      //   if (states.contains(MaterialState.pressed)) {
      //     return Colors.blue[200];
      //   }
      //   //默认不使用背景颜色
      //   return null;
      // }),
      backgroundColor: MaterialStateProperty.all(Colors.yellow),
      //设置水波纹颜色
      overlayColor: MaterialStateProperty.all(Colors.green),
      // //设置阴影  不适用于这里的TextButton
      elevation: MaterialStateProperty.all(10),
      // //设置按钮内边距
      // padding: MaterialStateProperty.all(EdgeInsets.all(10)),
      // //设置按钮的大小
      // minimumSize: MaterialStateProperty.all(Size(200, 100)),
      //
      // //设置边框
      side: MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
      // //外边框装饰 会覆盖 side 配置的样式
      shape: MaterialStateProperty.all(StadiumBorder()),
    )),
    // size opacity 不能影响到全局
    // iconTheme: IconThemeData(color: Colors.red, size: 10, opacity: 1)
    iconTheme: IconThemeData(color: Colors.red));

class GetXThemes extends StatelessWidget {
  const GetXThemes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主题"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              //直接设置Theme
              Get.changeTheme(
                  Get.isDarkMode ? appLightThemeData : appDarkThemeData);
              //设置ThemeMode
              // Get.changeThemeMode(ThemeMode.dark);
            },
            child: Text("TextButton"),
          ),
          OutlinedButton(onPressed: () {}, child: Text("OutlinedButton")),
          ElevatedButton(onPressed: () {}, child: Text("ElevatedButton")),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
            iconSize: 10,
          ),
          Container(
            color: Colors.transparent,
            height: 1,
          )
        ],
      ),
    );
  }
}
