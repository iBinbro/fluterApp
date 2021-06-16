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
                Get.to(() => HeroAnimationDemo2());
              },
              icon: Hero(tag: "123", child: Image.asset("images/home.png"))),
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
        child: Hero(tag: "123", child: Image.asset("images/homesel.png")),
      ),
    );
  }
}
