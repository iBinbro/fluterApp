import 'package:flutter/material.dart';
import 'package:circle_list/circle_list.dart';

class WheelExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('circle_list 圆形旋转widget 第三方组件使用'),
      ),
      body: SafeArea(
        child: Center(
          child: CircleList(origin: Offset(0, 0), children: [
            GestureDetector(child: Container(
              width: 10,
              height: 10,
              color: Colors.brown,
            ),onTap: (){
              print("点击棕色");
            },),
            Container(
              width: 10,
              height: 10,
              color: Colors.yellow,
            ),
            Container(
              width: 10,
              height: 10,
              color: Colors.blue,
            ),
            Container(
              width: 10,
              height: 10,
              color: Colors.yellow,
            ),
            Container(
              width: 10,
              height: 10,
              color: Colors.blue,
            ),
            Container(
              width: 10,
              height: 10,
              color: Colors.yellow,
            ),
            Container(
              width: 10,
              height: 10,
              color: Colors.blue,
            ),
          ]),
        ),
      ),
    );
  }
}
