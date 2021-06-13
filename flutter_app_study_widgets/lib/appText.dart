import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("富文本"),
      ),
      body: Container(
        width: 300,
        height: 500,
        child: Text.rich(
          TextSpan(
              text: "市场价格：",
              style: TextStyle(color: Colors.blue, fontSize: 20),
              //TextSpan 的style会影响到children 如果children没有style则延续父style
              children: [
                //放入一个widget和文本融合
                WidgetSpan(

                  //垂直位置对齐方式
                    alignment: PlaceholderAlignment.bottom,
                    child: Icon(
                      Icons.wrong_location_sharp,
                      size: 10,
                    )),
                TextSpan(
                  text: "199",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                  children: [
                    TextSpan(
                      text:
                          "22",
                      //添加手势
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("富文本点击事件");
                        },
                    )
                  ],
                ),
              ]),

          // clip,
          // 裁剪掉超出部分.

          // fade,
          // 超出部分透明.

          // ellipsis,
          // 省略号.

          // visible,
          // 可见.
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
    );
  }
}
