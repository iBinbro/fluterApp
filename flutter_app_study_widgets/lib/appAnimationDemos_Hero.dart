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
                // Get.to(() => HeroAnimationDemo2(), transition: Transition.noTransition);
                Get.to(
                  () => HeroAnimationDemo2(),
                  transition: Transition.cupertino,
                );
              },
              icon: Hero(
                tag: "123",
                child: Image.asset("images/home.png"),
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
