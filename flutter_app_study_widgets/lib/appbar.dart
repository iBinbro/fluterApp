import 'package:flutter/material.dart';

//Icon 图形图标，来自于所述的字体的字形绘制。图标不可交互式。
// 创建Icon对象要有IconData成员，而IconData可以从Icons类中直接获取!

//ImageIcon 自定义图形图标，来自于图片绘制。图标不可交互式。
//比起Icon，不同之处就是用自定义ImageProvider来定义图标
//ImageProvider待学习 e.g- AssetImage('images/main_title.png')

//IconButton 图形图标，可交互式的

class B_AppBar {
  static AppBar get appbar {
    return AppBar(
      //leading
      leadingWidth: 98.5,

      //   //在Scaffold中设置
      //     return Scaffold( extendBodyBehindAppBar: true,
      //则Scaffold的body会从导航栏下开始布局

      //如果有侧边栏 则自动设置leading作为一个侧拉按钮
      automaticallyImplyLeading: true,

      // leading: Icon(Icons.av_timer_rounded),
      leading: IconButton(
        icon: Image.asset("images/main_title.png"),
        onPressed: () {},
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      ),
      // leading: ImageIcon(AssetImage('images/main_title.png'), color: Colors.red,),//会被指定颜色渲染成纯色图片

      //title
      title: Text(
        "部件学习demo合集",
        style: TextStyle(fontSize: 14),
      ),

      //右侧按钮区域
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset("images/scan.png")),
        IconButton(onPressed: () {}, icon: Image.asset("images/service.png")),
      ],

      //实际效果相当于appbar的backgroundview 覆盖不到bottom 该属性通常在 SliverAppBar
      flexibleSpace: Container(
        color: Colors.orange,
        width: double.infinity,
        height: 200,
        child: Text(
          "flexibleSpace",
          textAlign: TextAlign.center,
        ),
      ),

      //appbar底部区域
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          width: double.infinity,
          color: Colors.red,
          child: Text("bottom"),
        ),
      ),
    );
  }
}
