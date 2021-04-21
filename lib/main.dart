import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'scrollview.dart';
import 'tab.dart';

void main() {

  runApp(BinApp()); //默认运行构造方法
}

class BinApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //构造方法返回一个app
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('nav title'),
    //   ),
    //   body: Container(
    //     child: ListView(
    //       children: [
    //         ListTile(
    //           title: Text('list title'),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("nav title"),
        // backgroundColor: Color.fromRGBO(55, 59, 78, 1),
        backgroundColor: Color.fromARGB(255, 55, 59, 78),
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Image.asset('images/退出登录icon.png'),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 3.5),

            ),
            Text(
              '退出',
              style: TextStyle(
                  fontSize: 10,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            )
          ],
        ),
        border: Border.all(style: BorderStyle.none),
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text(
                  'dialog 样例',
                  style:
                      TextStyle(decoration: TextDecoration.none, fontSize: 25),
                ),
              ),
              onTap: () {
                binDialog(context, '简单的样例');
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text(
                  '导航栏push pop 视图 传参方式一',
                  style:
                      TextStyle(decoration: TextDecoration.none, fontSize: 25),
                ),
              ),
              onTap: () {
                pushNextPage(context);
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text(
                  '导航栏push pop 视图 传参方式二',
                  style:
                  TextStyle(decoration: TextDecoration.none, fontSize: 25),
                ),
              ),
              onTap: () {
                pushNextPage2(context);
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text(
                  'scrollview',
                  style:
                  TextStyle(decoration: TextDecoration.none, fontSize: 25),
                ),
              ),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context){
                  return ScrollViewExample();
                }));
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text(
                  'tab example',
                  style:
                  TextStyle(decoration: TextDecoration.none, fontSize: 25),
                ),
              ),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context){
                  return TabPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  //dialog控件的基本使用
  void binDialog(BuildContext context, para) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            //✅ 弹窗的UI布局
            title: Text('alert'),
            // content: Text('content'),
            content: Column(
              children: [
                Text(para??'系统pop非点击pop'),
                Text('内容2'),
              ],
            ),
            actions: [
              CupertinoButton(
                  child: Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop(); //关闭弹窗
                  }),
              CupertinoButton(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop(); //关闭弹窗
                  })
            ],
          );
        });
  }

  //push下个页面 async...await...
  void pushNextPage(context) async {
    //页面回传参数方式一
    String para =
        await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      SecondPageWidget secondPage = SecondPageWidget(para: '我是第一个页面的参数');
      return secondPage;
    }));
    binDialog(context, para);
  }

  void pushNextPage2(context) {
    //页面回传参数方式二
    Navigator.push(context, CupertinoPageRoute(builder: (content) {
      return SecondPageWidget(para: 'para');
    })).then((value) {
      binDialog(context, value);
    });
  }
}

//第二个页面
class SecondPageWidget extends StatelessWidget {
  String para;

  SecondPageWidget({Key? key, required this.para}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('second page'),
      ),
      child: Center(
        child: GestureDetector(
          child: Text(para),
          onTap: () {
            Navigator.pop(context, '我是第二个参数');
          },
        ),
      ),
    );
  }
}
