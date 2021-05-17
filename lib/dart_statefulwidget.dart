import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BinStateFulExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  label: 'tab1', icon: Image.asset('images/退出登录icon.png')),
              BottomNavigationBarItem(
                  label: 'tab2', icon: Image.asset('images/退出登录icon.png')),
              BottomNavigationBarItem(
                  label: 'tab3', icon: Image.asset('images/退出登录icon.png')),
              BottomNavigationBarItem(
                  label: 'tab4', icon: Image.asset('images/退出登录icon.png')),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return StateFulText();
            } else if (index == 1) {
              return BinListFulWidget();
            }else if (index == 2) {
              return PartStateFulWidget();
            }
            return CounterWidget(1);
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
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: <Widget>[
            Text('${count}'),
            CupertinoButton(
                child: Text('+'),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                })
          ],
        ),
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

class PartStateFulWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateFulContent();
  }
}

//一个有状态的部件可以嵌套在无状态的组件下 setstate会重新调用build方法
class StateFulContent extends StatefulWidget {
  @override
  _StateFulContentState createState() => _StateFulContentState();
}

class _StateFulContentState extends State<StateFulContent> {

  int a = 10;

  @override
  Widget build(BuildContext context) {

    return CupertinoButton(child: Text(a.toString()), onPressed: (){
      setState(() {
        a = a+1;
      });
    },);
  }
}


class CounterWidget extends StatefulWidget {

  CounterWidget(this.intValue);

  int intValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

// widget State的生命周期
class _CounterWidgetState extends State<CounterWidget> {
  // initState：当Widget第一次插入到Widget树时会被调用，对于每一个State对象，Flutter framework只会调用一次该回调，
  // 所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等。
  @override
  void initState() {
    print("initState");
    super.initState();
  }
  /*当State对象的依赖发生变化时会被调用；例如：在之前build() 中包含了一个InheritedWidget，
  然后在之后的build() 中InheritedWidget发生了变化，
  那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
  典型的场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调。
  */
  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  /*build被调用的时机
  在调用initState()之后。
  在调用didUpdateWidget()之后。
  在调用setState()之后。
  在调用didChangeDependencies()之后。
  在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
  */
  @override
  Widget build(BuildContext context) {
    print("build");
    //获取state对于的statefulwidget
    int temp = widget.intValue;

    if (temp == 10){
      return CupertinoTextField(controller: TextEditingController(text: "hehehehe"),);
    }

    return CupertinoButton(child: Text(widget.intValue.toString()), onPressed: (){
      setState(() {
        widget.intValue++;
      });
    });
  }

  /*在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
  然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。正如之前所述，
  Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
  也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
  */
  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  /*当State对象从树中被移除时，会调用此回调。
  在一些场景下，Flutter framework会将State对象重新插到树中，
  如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
  如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
  */
  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  // 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }
  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    print("reassemble");
    super.reassemble();
  }

}




