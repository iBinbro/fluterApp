import 'package:flutter/material.dart';

class Flow_Demo_Delegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {

    double x = 0;

    // FlowPaintingContext:
    // - size 父容器的大小
    // - childCount 子控件数量
    // - getChildSize 获取对应索引的子控件大小
    // - paintChild 获取对应索引的子控件
    // 绘制子控件的布局位置
    for (int i=0; i<context.childCount; i++){

      //在指定位置绘制出子控件
      context.paintChild(i,transform: Matrix4.translationValues(i*50, 0, 0));

    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  // 有需要可以指定flow的大小
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(400, 400);
  }

}

class Flow_Demo extends StatelessWidget {
  Flow flow = Flow(
    delegate: Flow_Demo_Delegate(),
    children: [
      Container(
        width: 10,
        height: 10,
        color: Colors.red,
      ),
      Container(
        width: 10,
        height: 20,
        color: Colors.green,
      ),
      Container(
        width: 10,
        height: 39,
        color: Colors.deepPurple,
      ),
      Container(
        width: 10,
        height: 40,
        color: Colors.red,
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return flow;
  }
}
