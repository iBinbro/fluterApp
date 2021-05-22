import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/appLayout_flow.dart';

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

    Container container = Container(
      // width: 10,
      // height: 10,

      color: Colors.green,
      child: Align(
        // Alignment(x,y),
        // x:左边缘-1 中间0 右边缘1
        // y:上边缘-1 中间0 下边缘1
        // alignment: Alignment(-1,1),

        // FractionalOffset继承自Alignment，不过是以左上角顶点为坐标原点
        // FractionalOffset(x,y),
        // x:左边缘0 中间0.5 右边缘1
        // y:上边缘0 中间0.5 下边缘1
        alignment: FractionalOffset(1, 1),

        // widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；
        // 它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。
        // 如果值为null，则组件的宽高将会占用尽可能多的空间 这也解释了Center为什么能铺满屏幕。
        // 注：优先级低于设置了 width/height
        widthFactor: 1.5,
        heightFactor: 1.5,

        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );

    Container stackContainer = Container(
      color: Colors.red,
      width: 200,
      height: 300,
      child: Stack(
        textDirection: TextDirection.rtl,
        alignment: Alignment.center,

        //子部件宽高适应Stack的方式
        // StackFit.expand 延展满stack 如果stack没有设置宽高 则会铺满屏幕
        // StackFit.loose 维持自身大小
        fit: StackFit.expand,

        children: [
          Container(
            width: 10,
            height: 10,
            color: Colors.green,
          ),
          Container(
            width: 20,
            height: 20,
            color: Colors.blue,
          ),
        ],
      ),
    );

    Container stackPointedContainer = Container(
      color: Colors.red,
      width: 200,
      height: 300,
      child: Stack(

        textDirection: TextDirection.rtl,
        alignment: Alignment.center,

        //子部件宽高适应Stack的方式
        // StackFit.expand 延展满stack 如果stack没有设置宽高 则会铺满屏幕
        // StackFit.loose 维持自身大小
        fit: StackFit.loose,

        children: [
          Positioned(
            left: 10,
            top: 10,
            width: 100,
            height: 100,
            child: Container(

              //失效
              width: 100,
              height: 300,

              color: Colors.green,
            ),
          ),
          // Positioned(
          //     child: Container(
          //   width: 20,
          //   height: 20,
          //   color: Colors.blue,
          // )),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("layout 布局部件"),
      ),
      body: stackPointedContainer,
    );
  }
}
