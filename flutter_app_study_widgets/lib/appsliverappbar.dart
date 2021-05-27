import 'package:flutter/material.dart';

class AppSliverBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        text: "tab1",
      ),
      Tab(
        text: "tab2",
      )
    ];

    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, box) {
            return [
              SliverAppBar(
                //导航栏
                title: Text("nav title"),
                //导航栏高度
                toolbarHeight: 44,

                foregroundColor: Colors.blue,

                //导航栏背景色
                backgroundColor: Colors.green,

                //整个AppBar的高度 默认且最小为 toolbarHeight + bottom组件的高度
                expandedHeight: 44 + 100 + 150,

                //primary 导航栏的子组件布局顶部是否留出Padding空白(不是margin空白)以免和状态栏重合(无论设置与否 导航栏都是从顶部开始 而不是从状态栏下部开始)
                //flexibleSpace的高度范围 <= MAX(toolbarHeight+bottom组件的高度, expandedHeight)
                primary: true,

                //!!状态栏!!展开的部件 flexibleSpace的最大高度 MAX(toolbarHeight+bottom组件的高度, expandedHeight) + (primary)?(20):(0)
                flexibleSpace: Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 44 + 100 + 150 + 20,
                  child: Center(
                    // child: Text("flexibleSpace"),
                    child: Image.asset(
                      "images/BG.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),

                // pinned: true,

                //
                bottom: PreferredSize(
                    child: Container(
                      color: Colors.yellow,
                      width: double.infinity,
                      height: 100,
                      child: Center(
                        child: Text("bottom"),
                      ),
                    ),
                    preferredSize: Size.fromHeight(100)),
              )
            ];
          },
          body: Center(
            child: TabBar(tabs: tabs),
          ),
        ),
      ),
    );
  }
}
