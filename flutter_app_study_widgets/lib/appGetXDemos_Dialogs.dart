import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXDialogDemos extends StatelessWidget {
  const GetXDialogDemos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Dialogs"),
      ),

      //注：不管是 snacbar dialog 均为栈

      body: ListView(
        children: [
          Divider(),
          TextButton(
            child: Text("snacbar"),
            onPressed: () {
              Get.snackbar("snacbar", "message", onTap: (GetBarsnack) {
                print("snacbar ontap");
              }, duration: Duration(seconds: 5));
            },
          ),
          Divider(),
          TextButton(
            child: Text("dialog"),
            onPressed: () {
              Get.dialog(
                  Container(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("get dialog"),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Icon(Icons.close)),
                          Material(
                            child: IconButton(
                                onPressed: () {
                                  print("currentRoute = ${Get.currentRoute}");
                                },
                                icon: Icon(Icons.file_upload)),
                          )
                        ],
                      ),
                    ),
                  ),
                  //点击背景板是否关闭dialog
                  barrierDismissible: false);
            },
          ),
          Divider(),
          TextButton(
            child: Text("bottomSheet"),
            onPressed: () {
              Get.bottomSheet(
                  SafeArea(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("bottomSheet"),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Icon(Icons.close)),
                      Material(
                        child: IconButton(
                            onPressed: () {
                              print("currentRoute = ${Get.currentRoute}");
                            },
                            icon: Icon(Icons.file_upload)),
                      )
                    ],
                  )),
                  //点击背景板是否关闭dialog
                  isDismissible: false);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
