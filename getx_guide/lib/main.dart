import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx_Guide',
      getPages: [GetPage(name: "/123", page: () => HandelControllerPage())],
      home: const MyHomePage(title: 'Getx_Guide'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: TextButton(
              onPressed: () {
                Get.to(() {
                  return TestControllerPage();
                }, binding: CountItemBindings());
              },
              child: Icon(Icons.add))),
    );
  }
}

class TestController extends GetxController {
  String title = "TestController${DateTime.now().millisecondsSinceEpoch}";

  var intValue = 0.obs;
}

class TestControllerPage extends StatelessWidget {
  TestController testController = Get.put(TestController(), tag: "13131321");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hehe"),
      ),
      body: Center(child: ListView.builder(itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsetsDirectional.only(
            start: 10,
            end: 10,
            top: 10,
          ),
          height: 50,
          child: CountItem(),
        );
      })),
    );
  }
}

class PartController extends GetxController {
  String title = "PartController${DateTime.now().millisecond}";
  var intValue = 0.obs;
}

class CountItemBindings extends Bindings {
  @override
  void dependencies() {
    Get.create(() => TestController());
    // Get.put(TestController());
  }
}

class CountItem extends GetWidget {

  @override
  // TODO: implement tag
  String? get tag => super.tag;

  @override
  // TODO: implement controller
  get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    TestController testController = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          return Text(
              "title=${testController.title} value=${testController.intValue}");
        }),
        TextButton(
            onPressed: () {
              // testController.intValue = testController.intValue + 1;
              Get.to(() {
                return TestControllerPage();
              }, preventDuplicates: false, binding: CountItemBindings());
            },
            child: Icon(Icons.add))
      ],
    );
  }
}

class HandelControllerPage extends StatefulWidget {
  const HandelControllerPage({Key? key}) : super(key: key);

  @override
  _HandelControllerPageState createState() => _HandelControllerPageState();
}

class _HandelControllerPageState extends State<HandelControllerPage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   TestController controller = Get.find();
  //   print("HHH = ${controller.title}");
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   TestController controller = Get.find();
  //   print("XXX = ${controller.title}");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xixi"),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: TextButton(
              onPressed: () {
                Get.offNamed("/123", preventDuplicates: false);
              },
              child: Icon(Icons.add))),
    );
  }
}
