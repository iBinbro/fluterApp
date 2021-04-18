import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollViewExample extends StatelessWidget {
  ScrollViewExample({Key? key}) : super(key: key);

  List<String> datas = ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text('scrollview'),
      // ),
      child: Center(
        child: sampleNestedScrollView(context),
      ),
    );
  }

  //最简单的顶部悬浮效果样例
  NestedScrollView sampleNestedScrollView(context){
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.green,//吸顶效果位置的背景色
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('data', style: TextStyle(color: Colors.black),),
              background: Image.asset('images/back.png', fit: BoxFit.cover,),
            ),
          ),
        ];
      },
      floatHeaderSlivers: true,
      body: createList(context),
    );
  }

  ListView createList(context) {
    ListView listV = ListView.builder(
        padding:
            EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        itemCount: 50,
        itemBuilder: (context, index) {
          return Text('list');
        });
    return listV;
  }
}
