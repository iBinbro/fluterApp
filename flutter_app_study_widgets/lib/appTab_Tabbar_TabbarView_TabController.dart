import 'package:flutter/material.dart';

class AppTabbar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    //vsync：TabController的vsync是供其内部AnimationController使用的
    //AnimationController 的vsync需要传入一个TickerProvider，TickerProvider作为一个抽象类有一个方法createTicker。
    // 通过mixin SingleTickerProviderStateMixin里面实现的createTicker可以通过传入一个回调方法获得一个Ticker，Ticker就是一个帧定时器，在执行start之后会一直在指定时间内执行回调。
    // TabController tabController = TabController(initialIndex: 0, length: 3, vsync: this);

    List<Tab> tabs = [
      Tab(
        //Icons 会受 TabBar labelColor/unselectedLabelColor影响
        icon: Icon(Icons.ad_units_sharp),
        text: "tab1",
      ),
      Tab(
        text: "tab2",
        //定义了text 就不能定义 child
        // child: Text("tab1_child", style: TextStyle(color: Colors.red),),
      ),
      Tab(
        text: "tab3",
        icon: Image.asset("images/home.png"),
      )
    ];

    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab Tabbar TabbarView TabController"),
            bottom:
            TabBar(
              labelColor: Colors.red,
              unselectedLabelColor: Colors.yellow,

              tabs: tabs,

              // //指示器颜色(如果使用的是默认自带的指示器起作用)
              indicatorColor: Colors.red,

              //以下对自定义指示器以及自带默认指示器均有作用
              // //指示器的宽度
              // // TabBarIndicatorSize.label 跟textlabel同宽
              // // TabBarIndicatorSize.tab 跟tab同宽
              indicatorSize: TabBarIndicatorSize.tab,

              // //调整指示器的padding位置(具体效果类似margin 左右padding会减小指示器的宽度)
              indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              // 指示器的高度
              indicatorWeight: 50,

              //自定义指示器
              // BoxDecoration
              indicator: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/BG.png")),
              ),

            ),
          ),
          body: TabBarView(children: [Text("1"), Text("2"), Text("3")]),
        ));
  }
}
