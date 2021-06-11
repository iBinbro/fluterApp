import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  int? data;
  DataController(int data) {
    this.data = data;
    print(
        "DataController 构造函数 data = ${this.data} hashcode = ${this.hashCode}");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(
        "DataController data?? = ${this.data} \n this.hascode = ${this.hashCode}");
  }
}

class GetXShareController extends StatelessWidget {
  int data;

  GetXShareController(this.data);

  @override
  Widget build(BuildContext context) {
    print("GetXShareController data = ${this.data}");

    DataController dataController = DataController(this.data);
    //理解成一个栈一样 存放对应键值对 {tag : controller} 多个tag可对应同一个controller
    // 比如在商品详情页 A商品详情 => B商品详情 => A商品详情 如果使用商品id作为controller，那是不是可以达到共享效果
    Get.put(dataController, tag: "123");//类似用键值对的形式存储controller

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX 跨路由获取Controller"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<DataController>(
                init: dataController, //传入tag 且tag会指定到这个controller上
                tag: "321",
                // tag: this.data.toString(), //可通过这个tag找到对应的controller => Get.put(dataController,tag: "200");

                //❌❌❌❌❌❌❌❌controller该controller是通过 Get查找而来 并不是init:传入的controller❌❌❌❌❌
                builder: (controller) {
                  print(
                      "builder controller hashcode = ${controller.hashCode} data = ${controller.data}");

                  return Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(() => GetXShareController(200),
                              preventDuplicates: false);
                        },
                        child: Text(dataController.data.toString()),
                      ),
                      TextButton(
                        onPressed: () {
                          print(
                              "data == ${Get.find<DataController>(tag: "321").data}");
                        },
                        child: Text("获取DataController data"),
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
