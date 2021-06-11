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
    // Get.put(dataController);

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX 跨路由获取Controller"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<DataController>(
                init: dataController, //传入tag 且tag会指定到这个controller上
                tag: this.data.toString(), //可通过这个tag找到对应的controller
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
                              "data == ${Get.find<DataController>(tag: "200").data}");
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
