import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RichText richText = RichText(text: TextSpan(text: "text_span"));

    Text text = Text("data");

    Row row = Row(
      //主轴布局方向 rtl 从右向左布局
      textDirection: TextDirection.rtl,
      //******根据布局方向******设置对齐方式 TextDirection是从右到左 那start就是右边为起始
      mainAxisAlignment: MainAxisAlignment.start,

      //纵轴布局方向
      verticalDirection: VerticalDirection.down,
      //******根据布局方向******设置对齐方式 verticalDirection.down代表从上到下 那start就是顶部
      crossAxisAlignment: CrossAxisAlignment.start,

      //主轴 尽可能占满宽度
      mainAxisSize: MainAxisSize.max,
      //主轴 尽可能小 此时一般跟子部件一样大小
      // mainAxisSize: MainAxisSize.min,

      children: [
        Text("1"),
        Text("2"),
        Icon(Icons.ad_units_sharp),
      ],
    );

    //Row Column继承自Flex Flex结合Expand实现按比例分配空间
    Flex flex = Flex(

      direction: Axis.horizontal,

      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.end,

      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Text("data"),
            //实际上是无效设置 宽度跟flex系数相关
            width: 40,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text("data2"),
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Text("data3"),
            color: Colors.blue,
          ),
        )
      ],
    );

    //Flex Row Column 都是不支持换行或者换列的
    Wrap wrap = Wrap(

      // 水平方向摆放控件 并按照从右到左的顺序摆放
      //子控件的布局方向水平
      direction: Axis.horizontal,
      //子控件的布局方向
      textDirection: TextDirection.ltr,

      // //纵方向摆放控件 并按照从下到上的顺序摆放
      // // //子控件的布局方向垂直
      // direction: Axis.vertical,
      // // //子控件的布局方向
      // verticalDirection: VerticalDirection.down,

      //主轴控件的间隔
      spacing: 10,
      //主轴的对齐方式
      alignment: WrapAlignment.start,

      //纵轴控件的间隔
      runSpacing: 50,
      //纵轴对齐方式
      runAlignment: WrapAlignment.center,

      children: [
        Text("wrap1"),
        Text("wrap2"),
        Text("wrap3"),
        Text("wrap4"),
        Text("wrap5"),
        Text("wrap6"),
        Text("wrap7"),
        Text("wrap8"),
        Text("wrap9"),
        Text("wrap10"),
        Text("wrap11"),
        Text("wrap12"),
        Text("wrap13"),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("layout 布局部件"),
      ),
      body: wrap,
    );
  }
}
