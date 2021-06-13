import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,

      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(//创建底部tabbar
          backgroundColor: Colors.transparent,
          activeColor: Color.fromARGB(255, 102, 102, 102),
          inactiveColor: Color.fromARGB(255, 102, 102, 102),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('images/home.png'), label: '首页', activeIcon: Image.asset('images/homesel.png')),
            BottomNavigationBarItem(
                icon: Image.asset('images/cate.png'), label: '分类', activeIcon: Image.asset('images/catesel.png')),
            BottomNavigationBarItem(
                icon: Image.asset('images/buycar.png'), label: '购物车', activeIcon: Image.asset('images/buycarsel.png')),
            BottomNavigationBarItem(
                icon: Image.asset('images/mine.png'), label: '我的', activeIcon: Image.asset('images/minesel.png')),
          ],
          onTap: (index) {
            print('index==' + index.toString());
          },
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(//tabbaritme对应的页面
            builder: (context) {
              if (index == 0) {
                return Text('首页');
              } else if (index == 1) {
                return Text('分类');
              } else if (index == 2) {
                return Text('购物车');
              }
              return Text('我的');
            },
          );
        },
        // ),
      ),
    );
  }
}
