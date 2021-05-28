import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/B_drawer.dart';
import 'appcontext.dart';

class IconBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

class AppTab extends StatefulWidget {
  @override
  _AppTabState createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> {

  int _currentIndex = 0;

  List _pages = [AppContext(), Text("page2"), Text("page3"), Text("page4")];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BottomNavigationBar\nBottomNavigationBarItem\n构建底部导航栏",
          style: TextStyle(
            fontSize: 12,
          ),
          maxLines: 3,
        ),
      ),

      //左侧边栏 一般使用Drawer
      // drawer: B_drawer.drawer,

      //自定义一个drawer
      drawer: Container(
        color: Colors.purple,
        width: 200,
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(title: Text("data"));
        },itemCount: 20,),
      ),

      //右 侧边栏
      endDrawer: B_drawer.endDrawer,
      drawerScrimColor: Colors.red, //抽屉背景色
      drawerEdgeDragWidth: 100, //在距离屏幕边缘的距离范围内用户侧滑手势可以触发呼出抽屉事件
      drawerEnableOpenDragGesture: true, //侧滑手势是否可以呼出抽屉
      endDrawerEnableOpenDragGesture: true, //侧滑手势是否可以呼出抽屉

      //底部导航条上方的一组按钮 对应的悬浮按钮也会向上移动 所以跟dock的悬浮按钮显示上会有冲突
      persistentFooterButtons: [Text("data"),Text("data"),Text("data"),Text("data"),Text("data"),Text("data")],

      //按钮
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: IconBtn(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

      //内容体
      body: SafeArea(child: _pages[_currentIndex]),

      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        //移动模式(转盘模式)
        // type: BottomNavigationBarType.shifting,
        // showSelectedLabels: true,
        // showUnselectedLabels: true,

        //固定模式
        type: BottomNavigationBarType.fixed,

        //当前选择的索引
        currentIndex: _currentIndex,

        //items的点击事件 改变选中索引
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        //BottomNavigationBarItem 字体相关设置
        //BottomNavigationBarItem 选中状态非选中状态 字颜色和字体大小
        selectedItemColor: Colors.red,
        selectedFontSize: 14,
        selectedLabelStyle:
            TextStyle(backgroundColor: Colors.blue, height: 1.4),

        unselectedItemColor: Colors.black,
        unselectedFontSize: 14,
        unselectedLabelStyle:
            TextStyle(backgroundColor: Colors.green, height: 1.4),

        //底部栏items
        items: [
          BottomNavigationBarItem(

              //String 文本
              label: "home",

              //未选中时的图标
              icon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/home.png"),
              ),

              //选中后的图标
              activeIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/homesel.png"),
              )),
          BottomNavigationBarItem(
              label: "status",
              icon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/Quant.png"),
              ),
              activeIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/Quantsel.png"),
              )),
          BottomNavigationBarItem(
              label: "status",
              icon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/Quant.png"),
              ),
              activeIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/Quantsel.png"),
              )),
          BottomNavigationBarItem(
              label: "mine",
              icon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/mine.png"),
              ),
              activeIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 4.5),
                child: Image.asset("images/minesel.png"),
              )),
        ],
      ),
    );
  }
}
