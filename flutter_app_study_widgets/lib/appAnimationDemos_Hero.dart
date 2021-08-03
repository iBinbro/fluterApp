import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroAnimationDemo extends StatelessWidget {
  const HeroAnimationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                Get.to(() => HeroAnimationDemo2(),
                    transition: Transition.noTransition,
                    duration: Duration(seconds: 3));
                // Get.to(() => HeroAnimationDemo2(),
                //     transition: Transition.cupertino,
                //     duration: Duration(seconds: 3));
              },
              icon: Hero(
                tag: "123",
                child: Container(
                  color: Colors.brown,
                  width: 50,
                  height: 50,
                ),
                //执行动画时,child将被占位
                placeholderBuilder: (context, size, widget) {
                  return Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  );
                },
                //返回该hero时，做轨迹动画的控件
                flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  return Container(
                    color: Colors.yellow,
                    width: 50,
                    height: 50,
                  );
                },
                createRectTween: (rect1, rect2) {
                  return MaterialRectCenterArcTween(begin: rect1, end: rect2);
                },
                transitionOnUserGestures: true,
              )),
        ],
      ),
    );
  }
}

class HeroAnimationDemo2 extends StatelessWidget {
  const HeroAnimationDemo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画2"),
      ),
      body: Center(
        child: Hero(
          tag: "123",
          //这里有个问题，就是图片资源加载是耗时的，这里导致一个问题就是第一次执行hero时，轨迹动画中的组件是逐渐缩小的，
          // 因为这里的图片没加载出来就是0大小
          child: Image.asset("images/homesel.png"),
          //执行动画时,child将被占位
          placeholderBuilder: (context, size, widget) {
            return Container(
              color: Colors.green,
              width: 50,
              height: 50,
            );
          },
          //执行动画时，做轨迹动画的控件
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            return Container(
              color: Colors.purple,
              width: 50,
              height: 50,
            );
          },
          createRectTween: (rect1, rect2) {
            return MaterialRectCenterArcTween(begin: rect1, end: rect2);
          },
          transitionOnUserGestures: true,
        ),
      ),
    );
  }
}
