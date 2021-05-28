import 'package:flutter/material.dart';

class App404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("未知的路由地址 404 "),
      ),
      body: IconButton(
          onPressed: () {
            Navigator.pop(context, "返回参数");
          },
          icon: Icon(Icons.arrow_back)),
    );
  }
}
