import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BinStateFulExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  label: 'tab1', icon: Image.asset('images/退出登录icon.png')),
              BottomNavigationBarItem(
                  label: 'tab2', icon: Image.asset('images/退出登录icon.png')),
              BottomNavigationBarItem(
                  label: 'tab3', icon: Image.asset('images/退出登录icon.png')),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {

            //通过context查找最近的一个类型符合的组件
            var findResult = context.findAncestorWidgetOfExactType<DefaultTabController>();

            if (index == 0) {
              return StateFulText();
            } else if (index == 1) {
              return BinListFulWidget();
            }
            return Text('tab3');
          },
        ));
  }
}

class StateFulText extends StatefulWidget {
  @override
  _StateFulTextState createState() => _StateFulTextState();
}

class _StateFulTextState extends State<StateFulText> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("build 被调用了");
    return CupertinoPageScaffold(
      child: Center(
        child: ListView.builder(itemBuilder: (context, index){

          var findResult = context.findAncestorWidgetOfExactType<CupertinoPageScaffold>();

          if (index == 0) {
            return CupertinoButton(child: Text("button"), onPressed: (){

              // var findResult = context.findAncestorWidgetOfExactType<Center>();
              // print("==");

              setState(() {
                var findResult = context.findAncestorWidgetOfExactType<Center>();
                print("==");
              });

            });
          }
          return Text('listview');
        }),
      ),
    );
  }
}


class BinListFulWidget extends StatefulWidget {
  @override
  _BinListFulWidgetState createState() => _BinListFulWidgetState();
}

class _BinListFulWidgetState extends State<BinListFulWidget> {

  List <String>datas = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return CupertinoButton(child: Text(datas[index]), onPressed: (){
            setState(() {
              datas.add((datas.length+1).toString());
            });
          });
        },
      ),
    );
  }
}

class BinStatefulLifeCycle extends StatefulWidget {
  @override
  _BinStatefulLifeCycleState createState() => _BinStatefulLifeCycleState();
}

class _BinStatefulLifeCycleState extends State<BinStatefulLifeCycle> {

  widget.sta

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

