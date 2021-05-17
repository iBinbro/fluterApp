import 'package:flutter/cupertino.dart';

Widget createRouterApp() {
  return CupertinoApp(
      home: RouterDemo(),
      routes: {
        '/secondPage': (context) {
          //命名路由
          return SecondPage();
        },
        '/thirdPage': (context) {
          return ThirdPage();
        }
      },
      initialRoute: '/secondPage', //默认打开的一个路由(默认会push该路由一次),

      onGenerateRoute: (RouteSettings settings) {
        //以命名路由打开一个未在routes配置的路由会进入此回调
        return CupertinoPageRoute(builder: (context) {
          return SecondPage();
        });
      });
}

class RouterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text('then返回值的pop'),
                onPressed: () {
                  push(context);
                },
              ),
              CupertinoButton(
                child: Text('await返回值的pop'),
                onPressed: () {
                  pushAwait(context);
                },
              ),
              CupertinoButton(
                child: Text('命名路由'),
                onPressed: () {
                  Navigator.pushNamed(context, '/secondPage');
                },
              ),
              CupertinoButton(
                child: Text('命名路由打开一个不存在的路由'),
                onPressed: () {
                  Navigator.pushNamed(context, '/secondPage7777');
                },
              ),
            ],
          ),
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text('home nav'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          child: Text('await返回值的pop'),
          onPressed: () {
            Navigator.pop(context, 'pop参数');
          },
        ),
      ),
      navigationBar: CupertinoNavigationBar(),
    );
  }
}

//普通路由
void push(context) {
  // 普通路由push的两种写法
  Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) {
                return SecondPage();
              },
              fullscreenDialog: false))
      .then((value) => print('返回的值==${value}'));

//   Navigator.of(context).push(CupertinoPageRoute(
//       builder: (context) {
//         return SecondPage();
//       },
// //true 入栈打开视图 false 模态弹出视图
//       fullscreenDialog: false));
}

void pushAwait(context) async {
  var para = await Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) {
            return SecondPage();
          },
          fullscreenDialog: false));

  print('返回的值==${para}');
}

//命名路由的传值
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;

    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          child: Text('第三页面'),
          onPressed: () {
            Navigator.pop(context, 'pop参数');
          },
        ),
      ),
      navigationBar: CupertinoNavigationBar(),
    );
  }
}
