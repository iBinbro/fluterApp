import 'package:flutter/material.dart';

class AppConstraintBox extends StatelessWidget {
  ConstrainedBox constrainedBox = ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 50, maxWidth: 200, minHeight: 50, maxHeight: 200),
      //child控件会被尺寸容器的约束限制
      //ConstrainedBox A 嵌套ConstrainedBox B => min取 A/B 最小的 max取 A/B 最大的

      child: Container(width: 1, height: 1, color: Colors.red));

  SizedBox sizedBox = SizedBox(
    width: 10,
    height: 10,
    child: Container(width: 1, height: 1, color: Colors.red),
  );

  ConstrainedBox constrainedBox_UnconstrainedBox = ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
      child: UnconstrainedBox(
        //“去除”父级限制 即去除 60-100的限制(一般用于去除flutter自带组件的宽高限制 比如 AppBar的leading actions)
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
          child: Container(width: 50, height: 50, color: Colors.red),
        ),
      ));

  Container aspectRatioContainer = Container(
    width: 200,
    color: Colors.red,
    //AspectRatio作用于父组件，根据aspectRatio计算父控件的宽或者高。子组件的宽高不起作用 父组件设置一个高度或者宽度即可
    child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          color: Colors.green,
          width: 10,
          height: 10,
          child: Image.asset("images/back.png", fit: BoxFit.contain),
        )),
  );

  Container fractionallySizedBox = Container(
    width: 200,
    height: 300,
    color: Colors.red,
    //子组件的宽高不起作用 与FractionallySizedBox的宽高银子有关
    child: FractionallySizedBox(
        widthFactor: 0.5,//=>200*0.5
        heightFactor: 0.5,//=>300*0.5
        child: Container(
          color: Colors.green,
          width: 10,
          height: 10,
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        actions: <Widget>[
          //AppBar给actions设定了高度 这里的 height:20不起作用
          SizedBox(
            width: 50,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.white70),
            ),
          ),
          //去除AppBar给actions设定的高度
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),
      body: fractionallySizedBox,
    );
  }
}
