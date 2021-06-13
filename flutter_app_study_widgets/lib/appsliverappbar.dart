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
        initialIndex: 0,
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
                expandedHeight: 44 + 48 + 150, //不含状态栏20

                //primary SliverAppBar的子组件布局顶部是否留出Padding空白(不是margin空白)以免和状态栏重合(无论设置与否 导航栏都是从顶部开始 而不是从状态栏下部开始)
                //primary 为true 则flexibleSpace可利用的空间就会多出20
                //flexibleSpace的高度范围 <= MAX(toolbarHeight+bottom组件的高度, expandedHeight)
                primary: true,

                //!!状态栏!!展开的部件
                // flexibleSpace布局的起始位置不受primary的影响
                // flexibleSpace的最大高度 MAXHeight = MAX(toolbarHeight+bottom组件的高度, expandedHeight) + (primary)?(20):(0)
                // flexibleSpace的最小高度 150
                // flexibleSpace 中间弹性高度范围为 MAXHeight - 150
                //在最大高度内 flexibleSpace的高度根据拖拽情况随着变化
                flexibleSpace: ClipRect(
                  child: Container(
                    //ClipRect 裁剪flexibleSpace子组件超出部分
                    color: Colors.red,
                    width: double.infinity,
                    height: 44 +
                        48 +
                        20 +
                        150, //导航栏可浮动(可隐藏)(floating==true)的情况下为0 否则44 + 48 + 20 是flexibleSpace的最小高度
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.yellow,
                          width: 10,
                          height: 44 + 48,
                        ),
                        Container(
                          color: Colors.blue,
                          width: 10,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   color: Colors.red,
                //   width: double.infinity,
                //   height: 44 + 100 + 150 + 20,//150是flexibleSpace的最小高度 弹性高度为164
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         color: Colors.yellow,
                //         width: 10,
                //         height: 100,
                //       ),
                //       Container(
                //         color: Colors.blue,
                //         width: 10,
                //         height: 64,
                //       ),
                //     ],
                //   ),
                // ),

                //floating ScrollView向上滑动 导航栏是否会隐藏
                //floating false 导航栏一直显示
                //floating true 用户向上滑动 导航栏会渐变消失
                floating: false,
                //floating 为true时才会生效 SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态
                // snpa true 用户下滑操作 即使当前ScrollView不在顶部 flexibleSpace完全展开至最大高度；
                // false根据用户滑动的位置 按照距离ScrollView顶部的距离展开flexibleSpace
                snap: false,

                //bottom 部件是否悬停至SliverAppBar顶部有效位置(导航栏悬浮不隐藏则停在导航栏下 导航栏隐藏则在状态栏下 如果状态栏高度不包含在内 则置顶)
                pinned: true,
                //bottom组件
                bottom: TabBar(
                  tabs: tabs,
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              )
            ];
          },
          body: TabBarView(children: [
            ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text("title"),
              );
            }),
            ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text("title"),
              );
            })
          ]),
        ),
      ),
    );
  }
}
