import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RichText richText = RichText(text: TextSpan(text: "text_span"));

    Text text = Text("data");

    int a = 10;

    return Scaffold(
      appBar: AppBar(title: Text("layout 布局部件"),),
      body: Row(

        //布局方向 rtl 从右向左布局
        textDirection: TextDirection.rtl,
        //******根据布局方向******设置对齐方式 TextDirection是从右到左 那start就是右边为起始
        mainAxisAlignment: MainAxisAlignment.start,

        //Row 主轴 尽可能占满宽度
        mainAxisSize: MainAxisSize.max,
        //Row 主轴 尽可能小 此时一般跟子部件一样大小
        // mainAxisSize: MainAxisSize.min,

        children: [
          Text("1"),
          Text("2"),
          Text("3"),
        ],

      ),
    );
  }
}
