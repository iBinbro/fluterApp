import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//GetxController 管理数据 和 处理数据
//GetBuilder包裹要响应的组件
//GetxController调用update()重建GetBuilder包裹的子组件
//缺点:
//1.update();会调用所有引用该controller的builder，理想状态是按需更新指定的builder
// update([list...])可更新指定的多个id标识的builder,多个builder的id可重复

//2.要调用update();来更新 理想状态是希望只要_countNum值变了能自动更新
// ".obs"后缀添加，然后Obx(() => widget)包裹要更新的组件 注：包裹的组件必须含有.obs修饰的对象

class GetReactiveController extends GetxController {
  int _countNum = 0;
  void _countChange() {
    _countNum++;
    update(["build_add"]); //更新指定id的GetBuilder
  }

  int _countNum2 = 100;
  void _countChange2() {
    _countNum2--;
    update(["build_minus"]); //更新指定id的GetBuilder
  }

//   extension IntExtension on int {
//   /// Returns a `RxInt` with [this] `int` as initial value.
//   RxInt get obs => RxInt(this);
// }
//  .obs的作用其实就是用Rx包裹 返回Rx类型的对象
  var _countNum3 = 999.obs;
  // ==var _countNum3 = RxInt(999);

  @override
  void onInit() {
    super.onInit();
    print('GetReactiveController--onInit');

    // Workers
    /// 每次更改都会回调
    ever(_countNum3,
        (temp) => print("Workers ```ever``` ==> $temp obs的值每次改变都会调用"));

    // /// 第一次更改回调
    // once(_countNum3, (temp) => print("Workers ```once``` ==> $temp obs的值第一次被更改时调用"));
    //
    ///最后一次值发生变化，并在之后指定时间内值都没再发生变化，指定时间延迟后回调一次,得到最后一次的值
    debounce(
        _countNum3,
        (temp) => print(
            "Workers ```debounce``` ==> $temp obs的值最后一次改变后的指定延迟内，没有再改变则会调用(常用与用户搜索，当用户在连续输入完关键字后再调用接口 而不是输入一个字就调用一次)"),
        time: Duration(seconds: 3));

    ///每次值改变时，指定时间后回调一次(延迟期间不会再重复触发),得到第一次改变的值
    interval(
        _countNum3,
        (temp) => print(
            "Workers ```interval``` ==>  $temp obs的值改变后延时指定时间调用一次但是返回的是当时改变的值(比如点击时值变成了20，在3秒内再点击改变值，3s后返回的都是当时点击的20)"),
        time: Duration(seconds: 3));
  }

  @override
  void onReady() {
    super.onReady();
    print('GetReactiveController--onReady');
  }

  @override
  void onClose() {
    super.onClose();
    print('GetReactiveController--onClose');
  }
}

class GetxReactive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX State的管理 响应式"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //两个GetBuilder使用的是同一个controller
          GetBuilder<GetReactiveController>(
              id: "build_add",
              init: GetReactiveController(),
              //❌❌❌❌❌❌❌❌controller该controller是通过 Get查找而来 并不是init:传入的controller❌❌❌❌❌
              builder: (controller) {
                print("builder _countNum");
                return Text(controller._countNum.toString());
              }),
          GetBuilder<GetReactiveController>(
              id: "build_minus",
              init: GetReactiveController(),
              //❌❌❌❌❌❌❌❌controller该controller是通过 Get查找而来 并不是init:传入的controller❌❌❌❌❌
              builder: (controller) {
                print("builder _countNum2");
                return Text(controller._countNum2.toString());
              }),
          Obx(() {
            return Text(
                "obs 响应式更新数据 = ${Get.find<GetReactiveController>()._countNum3}");
          }),
        ],
      ),
      floatingActionButton: Container(
        width: 100,
        height: 100,
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  Get.find<GetReactiveController>()._countChange();
                },
                icon: Icon(Icons.add)),
            IconButton(
              onPressed: () {
                Get.find<GetReactiveController>()._countChange2();
                Get.find<GetReactiveController>()._countNum3.value =
                    Random().nextInt(100);
              },
              icon: Icon(Icons.minimize),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
