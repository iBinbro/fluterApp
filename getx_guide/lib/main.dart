import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_controller_study.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx_Guide',
      getPages: [GetPage(name: "/123", page: () => TestControllerPage())],
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
                }, binding: TestBindings());
              },
              child: Icon(Icons.arrow_forward))),
    );
  }
}
