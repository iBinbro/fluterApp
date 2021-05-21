import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/appLayout.dart';
import 'package:flutter_app_study_widgets/appText.dart';
import 'package:flutter_app_study_widgets/appbar.dart';
import 'package:flutter_app_study_widgets/apptab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List titles = ["构建底部导航栏", "文本/富文本显示", "布局组件"];

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
                switch (index) {
                  case 0:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AppTab();
                      }));
                    }
                    break;
                  case 1:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AppText();
                      }));
                    }
                    break;
                  case 2:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return AppLayout();
                          }));
                    }
                    break;
                }
              },
            );
          },
          itemCount: titles.length,
        ),
      ),
    );
  }
}
