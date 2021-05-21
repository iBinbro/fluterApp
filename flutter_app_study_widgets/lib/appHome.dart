import 'package:flutter/material.dart';

class AStateLessWidget extends StatelessWidget {

  void printA(){
    print("AStateLessWidget - printA");
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){

      //findAncestorStateOfType 查找距离本context最近的有对应的State
      //findAncestorStateOfType 查找当前context的上级节点(上级节点没有再查上上级节点)指定特定类型的State
      //注意：并不查找context本身 至少从context的上级开始查找
      ScaffoldState? scaffoldState = context.findAncestorStateOfType<ScaffoldState>();
      scaffoldState?.openDrawer();

      _CStatefulWidgetState? _cStatefulWidgetState = context.findAncestorStateOfType<_CStatefulWidgetState>();
      if (_cStatefulWidgetState != null){
        print("查找到了_CStatefulWidgetState");
      }

      //findRootAncestorStateOfType 查找距离本context最远的有对应的State 这里会把最外面的Drawer打开
      ScaffoldState? rootScaffoldState = context.findRootAncestorStateOfType<ScaffoldState>();
      rootScaffoldState?.openDrawer();

      //findAncestorWidgetOfExactType 查找Widget
      CStatefulWidget? cStatefulWidget = context.findAncestorWidgetOfExactType<CStatefulWidget>();
      cStatefulWidget?.printC();

      //aStateLessWidget 是 null的 因为说过 并不查找context本身 至少从context的上级开始查找
      AStateLessWidget? aStateLessWidget = context.findAncestorWidgetOfExactType<AStateLessWidget>();
      aStateLessWidget?.printA();

      var a = context.findAncestorRenderObjectOfType();
      var b = context.findRenderObject();

    }, icon: Icon(Icons.add));
  }
}

class BStateLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AStateLessWidget();
  }
}

class CStatefulWidget extends StatefulWidget {

  void printC(){
    print("CStatefulWidget - printC");
  }

  @override
  _CStatefulWidgetState createState() => _CStatefulWidgetState();
}

class _CStatefulWidgetState extends State<CStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return BStateLessWidget();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      drawer: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),

      body: CStatefulWidget(),
    );
  }
}
