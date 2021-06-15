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
    primaryColor: Colors.red, // 主要部分背景颜色（导航和tabBar等）
    scaffoldBackgroundColor:
        Colors.red, //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
    textTheme: TextTheme(headline1: TextStyle(color: Colors.yellow)),
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.yellow)));

//创建light ThemeData对象
final ThemeData appLightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white, // 主要部分背景颜色（导航和tabBar等）
    scaffoldBackgroundColor:
        Colors.white, //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
    textTheme: TextTheme(headline1: TextStyle(color: Colors.blue)),
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black)));

class GetXThemes extends StatelessWidget {
  const GetXThemes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主题"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            //直接设置Theme
            Get.changeTheme(
                Get.isDarkMode ? appLightThemeData : appDarkThemeData);
            //设置ThemeMode
            // Get.changeThemeMode(ThemeMode.dark);
          },
          child: Text(
            "更换主题",
            style: Get.textTheme.headline1, //通过Theme获取颜色
          ),
        ),
      ),
    );
  }
}
