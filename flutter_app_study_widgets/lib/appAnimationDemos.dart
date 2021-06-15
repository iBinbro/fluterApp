import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAnimationDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return IconButton(
              onPressed: () {
                Get.to(() => SampleAnimation());
              },
              icon: Text("简单的高度变化动画"));
        }));
  }
}

class SampleAnimation extends StatefulWidget {
  const SampleAnimation({Key? key}) : super(key: key);

  @override
  _SampleAnimationState createState() => _SampleAnimationState();
}

class _SampleAnimationState extends State<SampleAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 10), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller!)
      ..addListener(() {
        setState(() => {});
      });
    //启动动画(正向执行)
    controller!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Center(
          child: Image.asset(
            "images/minesel.png",
            width: animation!.value,
            height: animation!.value,
          ),
        ));
  }
}
