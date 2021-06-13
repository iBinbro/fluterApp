import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BinBanner extends StatelessWidget {

  List banners;
  double bannerHeight;

  BinBanner(this.banners, this.bannerHeight);

  @override
  Widget build(BuildContext context) {

    //创建一个swiperController 然后设置到Swiper的controller属性，用于接受用户事件控制swiper
    SwiperController swiperController = SwiperController();

    return Swiper(
      controller: swiperController,
      //用户操作swiper时是否暂停自动轮播
      autoplayDisableOnInteraction: true,
      itemCount: banners.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Image.asset(
            'images/homesel.png',
            fit: BoxFit.cover,
          ),
        );
      },
      onIndexChanged: (index) {
        //swiper滑动到指定的index
        print("current_index = $index");
      },
      onTap: (index) {
        print("点击对应的banner 触发业务逻辑 current_tap_index = $index");
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,
      loop: true,
      pagination: SwiperPagination(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        alignment: Alignment.bottomCenter,
        builder: SwiperPagination.dots,
      ),
      // pagination: SwiperCustomPagination(
      //     builder: (BuildContext context, SwiperPluginConfig config) {
      //       return Container(//作为指示器的付控件
      //         // color: Colors.transparent,//不设置颜色则不会响应手势 不会遮挡到swiper
      //         margin: EdgeInsets.fromLTRB(0, bannerHeight-20, 0, 10+10),
      //         alignment: Alignment.bottomCenter,
      //         child: createIndicator( swiperController, config),
      //       );
      //     }),
    );;
  }
}

AnimatedSmoothIndicator createIndicator( SwiperController swiperController,SwiperPluginConfig config){
  return AnimatedSmoothIndicator(
    activeIndex: config.activeIndex,
    count: config.itemCount,
    axisDirection: config.scrollDirection,
    onDotClicked: (index){
      // swiperController.stopAutoplay();
      swiperController.move(index, animation: true);
      // print("点击指示器滑动到 = $index");
      // Timer( Duration(seconds: 2), (){
      //   swiperController.startAutoplay();
      // });
    },
  );
}

