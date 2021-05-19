import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/appbar.dart';
import 'package:flutter_app_study_widgets/apptab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List titles = ["构建底部导航栏"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //点击效果高亮颜色设置
      // theme: ThemeData(
      //     splashColor: Colors.transparent, highlightColor: Colors.transparent),

      home: Scaffold(



        //顶部导航栏
        appBar: B_AppBar.appbar,

        //内容区域
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(titles[index]),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AppTab();
                }));
              },
            );
          },
          itemCount: titles.length,
        ),



      ),
    );
  }
}
