import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/appDioNetRequest_jsonModel.dart';
import 'package:flutter_app_study_widgets/appRouter404Page.dart';
import 'package:flutter_app_study_widgets/appConstraintBox.dart';
import 'package:flutter_app_study_widgets/appLayout.dart';
import 'package:flutter_app_study_widgets/appRouter.dart';
import 'package:flutter_app_study_widgets/appTab_Tabbar_TabbarView_TabController.dart';
import 'package:flutter_app_study_widgets/appText.dart';
import 'package:flutter_app_study_widgets/appTextInput.dart';
import 'package:flutter_app_study_widgets/appbar.dart';
import 'package:flutter_app_study_widgets/appsliverappbar.dart';
import 'package:flutter_app_study_widgets/assertsImageIcon.dart';
import 'appBottomNavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List titles = [
    "构建底部导航栏",
    "文本/富文本显示",
    "布局组件 row column flow stack",
    "尺寸限制容器",
    "Assets、Images、Icon",
    "TextField TextFormField",
    "SliverAppBar (实现了吸顶效果以及tab切换视图)",
    "全局浮动按钮 Overlay/OverlayEntry",
    "Tab Tabbar TabbarView TabController",
    "路由跳转并传参",
    "routes onGenerateRoute 均未找到该路由 进入onUnknownRoute 返回404",
    "网络请求Dio json模型转换",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //点击效果高亮颜色设置
      // theme: ThemeData(
      //     splashColor: Colors.transparent, highlightColor: Colors.transparent),

      //默认打开的路由
      // initialRoute: "/AppTabbar",

      //静态命名路由 无法传参
      routes: {
        "/AppTabbar": (context) {
          return AppTabbar();
        },
        "/AppSliverBar": (context) {
          return AppSliverBar();
        }
      },
      //在静态路由未找到相应路由会进入此回调 这里可获取参数
      onGenerateRoute: (RouteSettings settings) {
        var para = settings.arguments;
        var routerString = settings.name;

        if (routerString == "/Routerpara") {
          return MaterialPageRoute(builder: (context) {
            return Routerpara((para is String) ? (para) : "传入失败 参数不是字符串");
          });
        }
      },

      //routes onGenerateRoute 静态路由 动态路由均为找到 则进入此回调
      onUnknownRoute: (RouteSettings settings) {
        print("onUnknownRoute");
        return MaterialPageRoute(builder: (context) {
          return App404Page();
        });
      },

      home: Scaffold(
        //顶部导航栏
        appBar: B_AppBar.appbar,

        //内容区域
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(titles[index]),
              //⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️async使其支持异步等待 Navigator pop 返回值
              // onTap: () {
              onTap: () async {
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
                  case 3:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AppConstraintBox();
                      }));
                    }
                    break;
                  case 4:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ImageDisplayExample();
                      }));
                    }
                    break;
                  case 5:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AppInput();
                      }));
                    }
                    break;
                  case 6:
                    {
                      Navigator.pushNamed(context, "/AppSliverBar");
                    }
                    break;
                  case 7:
                    {}
                    break;
                  case 8:
                    {
                      Navigator.pushNamed(context, "/AppTabbar");
                    }
                    break;
                  case 9:
                    {
                      //function 必须支持 async
                      var para = await Navigator.pushNamed(
                          context, "/Routerpara",
                          arguments: "动态路由传参本字符即为参数");
                      print("通过 async和await 得到的 pop返回得到的参数 = ${para}");
                    }
                    break;
                  case 10:
                    {
                      // Navigator.pushNamed(context, "/unknowRout", arguments: "没有配置的路由");

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return App404Page();
                      })).then((value) {
                        print("通过then 得到的 pop 返回参数 = ${value}");
                      });
                    }
                    break;
                  case 11:
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return NetListView();
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
