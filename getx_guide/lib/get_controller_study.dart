import 'package:flutter/material.dart';
import 'package:get/get.dart';

//*******GetView GetWidget*******
//

class TestController extends GetxController {
  String title = "TestController";

  int testValue = DateTime.now().millisecondsSinceEpoch;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("onInit testValue = ${testValue}");
  }
}

class TestBindings extends Bindings {
  @override
  void dependencies() {
    //每次Get.find<TestController>()会重新生成一个新的Controller
    // Get.create(() => TestController());
    //每次Get.find<TestController>()会返回相同的一个controller

    TestController testController2 = TestController();
    testController2.testValue = 2;
    Get.put(testController2);
    // Get.create(() => testController2);

    TestController testController = TestController();
    testController.testValue = 1;
    Get.put(testController);
    // Get.create(() => testController);

    //这里打印出来的是2  而不是1 后面put的并不会替换掉先put的 put换成create也是一样的效果
    print("${Get.find<TestController>().testValue}");
  }
}

class TestGetView extends GetView<TestController>{
  @override
  Widget build(BuildContext context) {

    Get.put(TestController());

    return GestureDetector(
      onTap: () {
        //如果controller是create 每一次的controller都是重新生成的
        // print("TestGetView testValue = ${controller.testValue}");

        TestController testController = TestController();
        testController.testValue = 999;
        Get.put(testController, tag: "123");
        print("TestGetView testValue = ${Get.find<TestController>(tag: "123").testValue}");
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 10),
        height: 50,
        child: Text("TestGetView"),
      ),
    );
  }
}

class TestGetWidget extends GetWidget<TestController>{
  @override
  Widget build(BuildContext context) {

    Get.put(TestController());

    return GestureDetector(
      onTap: () {
        print("TestGetWidget testValue = ${controller.testValue}");
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 10),
        height: 50,
        child: Text("TestGetWidget"),
      ),
    );
  }
}

class TestControllerPage extends StatelessWidget {
  const TestControllerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(Get.find<TestController>().title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TestGetView(),
            TestGetView(),
            TestGetWidget(),
            TestGetWidget(),
          ],
        ),
      ),
    );
  }
}
