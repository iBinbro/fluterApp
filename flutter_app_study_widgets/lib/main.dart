import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/appAsync_Future.dart';
import 'package:flutter_app_study_widgets/appDioNetRequest_jsonModel.dart';
import 'package:flutter_app_study_widgets/appGetXDemos.dart';
import 'package:flutter_app_study_widgets/appGetXDemos_Dialogs.dart';
import 'package:flutter_app_study_widgets/appGetXDemos_ShareControllerThroughRoute.dart';
import 'package:flutter_app_study_widgets/appGetXDemos_language.dart';
import 'package:flutter_app_study_widgets/appGetXDemos_reactive.dart';
import 'package:flutter_app_study_widgets/appGetXDemos_themes.dart';
import 'package:flutter_app_study_widgets/appRouter404Page.dart';
import 'package:flutter_app_study_widgets/appConstraintBox.dart';
import 'package:flutter_app_study_widgets/appLayout.dart';
import 'package:flutter_app_study_widgets/appRouter.dart';
import 'package:flutter_app_study_widgets/appSimpleWebBrower.dart';
import 'package:flutter_app_study_widgets/appSingleton.dart';
import 'package:flutter_app_study_widgets/appTab_Tabbar_TabbarView_TabController.dart';
import 'package:flutter_app_study_widgets/appText.dart';
import 'package:flutter_app_study_widgets/appTextInput.dart';
import 'package:flutter_app_study_widgets/appbar.dart';
import 'package:flutter_app_study_widgets/appsliverappbar.dart';
import 'package:flutter_app_study_widgets/assertsImageIcon.dart';
import 'package:get/state_manager.dart';
import 'appBottomNavigationBar.dart';
import 'package:get/get.dart';

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
    "网络请求Dio json模型转换 页面异步刷新",
    "flutter 异步编程 Future、async、await、FutureBuilder",
    "webview",
    "单例",
    "Getx",
    "Getx Dialog",
    "Getx Reactive=> obs workers",
    "Getx 路由间互相读取controller数据(跨路由读取controller)",
    "Getx 国际化",
    "Getx 改变主题",
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //点击效果高亮颜色设置
      // theme: ThemeData(
      //     splashColor: Colors.transparent, highlightColor: Colors.transparent),

      //*****路由相关*****//
      //Get路由
      //Get命名路由
      getPages: [
        GetPage(name: "/getxDemos", page: () => GetXDemos()),
        GetPage(name: "/getxDemos/:namepara", page: () => GetXDemos()),
        GetPage(name: "/apptext", page: () => AppText()),
        GetPage(name: "/GexReactive", page: () => GetxReactive()),
        GetPage(name: "/shareController", page: () => GetXShareController(999)),
      ],
      //Get出栈入栈默认的动画效果 只会影响到命名路由
      defaultTransition: Transition.cupertino,
      //默认push路由 路由可以进行拼接 测试只能打开两个 多了报错
      initialRoute: "/getxDemos",

      //原生路由
      //默认打开的路由
      // initialRoute: "/AppTabbar",
      //静态命名路由 无法传参
      routes: {
        "/AppTabbar": (context) {
          return AppTabbar();
        },
        "/AppSliverBar": (context) {
          return AppSliverBar();
        },
        "/Routerpara": (context) {
          return Routerpara("12");
        },
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
      //routes onGenerateRoute 静态路由 动态路由均未找到 则进入此回调
      onUnknownRoute: (RouteSettings settings) {
        print("onUnknownRoute");
        return MaterialPageRoute(builder: (context) {
          return App404Page();
        });
      },

      //国际化
      translations: LanguageTransition(), //国际化的键值存储对象
      // locale: Locale("zh", "CN"),
      locale: Locale("zhzhzhzhzhzhzhzh", "?????"), //默认的语言
      fallbackLocale:
          Locale('enenenenenenenen', "?????????"), //应用指定语言失败时，指定一个固定语言
      // fallbackLocale: Locale('en', "US"),

      //主题
      theme: appLightThemeData,
      darkTheme: appDarkThemeData,

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NetListView();
                      }));
                    }
                    break;
                  case 12:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AppAsync();
                      }));
                    }
                    break;
                  case 13:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AWebBrower("https://www.baidu.com");
                      }));
                    }
                    break;
                  case 14:
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Singleton();
                      }));
                    }
                    break;
                  case 15:
                    {
                      Get.to(() => GetXDemos(),
                          transition: Transition.cupertino);
                    }
                    break;
                  case 16:
                    {
                      Get.to(() => GetXDialogDemos(),
                          transition: Transition.cupertino);
                    }
                    break;
                  case 17:
                    {
                      Get.toNamed("/GexReactive", preventDuplicates: false);
                    }
                    break;
                  case 18:
                    {
                      Get.toNamed("/shareController", preventDuplicates: false);
                    }
                    break;
                  case 19:
                    {
                      Get.to(() => GetxLanguage());
                    }
                    break;
                  case 20:
                    {
                      Get.to(() => GetXThemes());
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
