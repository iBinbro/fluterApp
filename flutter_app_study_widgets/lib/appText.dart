import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("富文本"),
      ),
      body: Text.rich(
        TextSpan(
            text: "市场价格：",
            style: TextStyle(color: Colors.blue, fontSize: 20),
            //TextSpan 的style会影响到children 如果children没有style则延续父style
            children: [
              //放入一个widget和文本融合
              WidgetSpan(
                  child: Icon(
                Icons.wrong_location_sharp,
                size: 30,
              )),
              TextSpan(
                text: "199",
                style: TextStyle(color: Colors.red, fontSize: 30),
                children: [
                  TextSpan(
                    text: "https://www.baidu.com",
                    //添加手势
                    recognizer: TapGestureRecognizer()..onTap = () {
                      print("富文本点击事件");
                    },
                  )
                ],
              )
            ]),
        maxLines: 2,
      ),
    );
  }
}
