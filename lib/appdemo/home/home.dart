import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List banners = ["1", "2", "3", "4"];

    double bannerHeight = (MediaQuery.of(context).size.width - 20 * 2) * 150 / 335;

    return Scaffold(
      appBar: createAppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: (bannerHeight + 20),
              child: createSwiper(context, banners, bannerHeight),
            );
          } else if (index == 1) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CoinRateGrid("ETH/USDT", "1578.11", "≈¥10230.13"),
                CoinRateGrid("ETH/USDT", "1578.11", "≈¥10230.13"),
                CoinRateGrid("ETH/USDT", "1578.11", "≈¥10230.13"),
              ],
            );
          }
          return ListTile(
            title: Text("cell"),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class CoinRateGrid extends StatelessWidget {
  String coinType;
  String num;
  String price;

  CoinRateGrid(this.coinType, this.num, this.price);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(coinType),
        Text(num),
        Text(price),
      ],
    );
  }
}

AnimatedSmoothIndicator createIndicator( SwiperController swiperController,SwiperPluginConfig config){
  return AnimatedSmoothIndicator(
    activeIndex: config.activeIndex,
    count: config.itemCount,
    axisDirection: config.scrollDirection,
    onDotClicked: (index){
      swiperController.stopAutoplay();
      swiperController.move(index, animation: true);
      Timer( Duration(seconds: 2), (){
        swiperController.startAutoplay();
      });
    },
  );
}

Swiper createSwiper(BuildContext context, List banners, double bannerHeight){

  SwiperController swiperController = SwiperController();

  return Swiper(
    controller: swiperController,
    autoplayDisableOnInteraction: true,
    itemCount: banners.length,
    itemBuilder: (context, index) {
      return Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Image.asset(
          'images/minetop.png',
          fit: BoxFit.cover,
        ),
      );
    },
    onIndexChanged: (index) {
      print("current_index = $index");
    },
    onTap: (index) {
      print("点击对应的banner 除非业务逻辑 current_tap_index = $index");
    },
    indicatorLayout: PageIndicatorLayout.COLOR,
    autoplay: true,
    loop: true,
    pagination: SwiperCustomPagination(
        builder: (BuildContext context, SwiperPluginConfig config) {
          return Container(
            // color: Colors.transparent,//不设置颜色则不会响应手势 不会遮挡到swiper
            margin: EdgeInsets.fromLTRB(0, bannerHeight-20, 0, 10+10),
            alignment: Alignment.bottomCenter,
            child: createIndicator( swiperController, config),
          );
        }),
  );
}

AppBar createAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    titleSpacing: 0,
    title: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'images/main_title.png',
                fit: BoxFit.contain,
              ),
              // margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Image.asset("images/scan.png")),
                IconButton(
                    onPressed: () {}, icon: Image.asset("images/service.png")),
              ],
            )
          ],
        ),
        Text(
          "Home",
          style: TextStyle(color: Colors.red),
        ),
      ],
    ),
  );
}
