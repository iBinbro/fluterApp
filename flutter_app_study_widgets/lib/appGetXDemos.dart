import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 有两个字段可以传参
    //arguments传参
    var argument = Get.arguments;
    print("我接收到了arguments=${argument}");

    //parameters传参
    var para = Get.parameters;
    print("我接收到parameters=${para}");

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX 的 使用"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: Text("Get.to 的 push"),
                onPressed: () {
                  // 顶层GetMaterialApp的相关设置
                  /*
                return GetMaterialApp(

                    //*****路由相关*****//
                    //Get路由
                    //Get命名路由
                    getPages: [
                    GetPage(name: "/getxDemos", page: () => GetXDemos()),
                GetPage(name: "/getxDemos/:namepara", page: () => GetXDemos())//命名路由还可以直接跟参数
                ],
                //Get出栈入栈默认的动画效果 只会影响到命名路由
                defaultTransition: Transition.cupertino,
                //默认push一个路由
                initialRoute: "/getxDemos",

                 */

                  //to/toNamed: preventDuplicates 是否阻止打开相同类型的Widget(可用于仅打开登陆页等,其他情况要设置成false)
                  // 相同类型的Widget:将Get进行封装(如下) 发现路由为 [GETX] GOING TO ROUTE /() => Widget
                  //路由是根据指针类型(Widget)生成的，而不是传入的实际类型
                  // push(Widget toWidget) {
                  //   Get.to(() => toWidget,
                  //       transition: Transition.cupertino, preventDuplicates: false);
                  // }

                  Get.to(
                    () => GetXDemos(),
                    arguments: "arguments字段传参",
                    preventDuplicates: false,
                  );
                },
              ),
              Divider(),
              TextButton(
                child: Text("Get.toNamed 的 push"),
                onPressed: () {
                  Get.toNamed("/getxDemos",
                      arguments: "arguments字段传参",
                      parameters: {"parameters": "parameters字段传参"},
                      preventDuplicates: false);
                },
              ),
              Divider(),
              TextButton(
                child: Text(
                  "类似URL传参\n[格式]:[命名路由?a=x&b=y...]\n通过```Get.parameters```获取",
                  style: TextStyle(),
                ),
                onPressed: () {
                  Get.toNamed("/getxDemos?urlpara=URL方式传参&urlpara2=URL方式传参",
                      preventDuplicates: false);
                },
              ),
              Divider(),
              TextButton(
                child: Text(
                    '''命名路由名称带入参数 参数不能是中文\nGet.toNamed("/getxDemos2/namepppaaa"'''),
                onPressed: () {
                  Get.toNamed("/getxDemos/namepppaaa",
                      preventDuplicates: false);
                },
              ),
              Divider(),
              TextButton(
                child: Text("无参push"),
                onPressed: () {
                  Get.toNamed("/getxDemos", preventDuplicates: false);
                },
              ),
              Divider(),
              TextButton(
                child: Text("无参push 进入点击 pop传参 可获得pop的参数"),
                onPressed: () async {
                  var popPara =
                      await Get.toNamed("/getxDemos", preventDuplicates: false);
                  print("pop 传参 = ${popPara}");
                },
              ),
              Divider(),
              TextButton(
                child: Text("pop操作 并返回参数"),
                onPressed: () {
                  Get.back(result: 12);
                },
              ),
              Divider(),
              TextButton(
                child: Text("pop 到指定页面 Get.until..."),
                onPressed: () {
                  Get.until((route) {
                    print("currentRoute = ${Get.currentRoute}");
                    return Get.currentRoute == "/getxDemos";
                    //如果是非命名路由跳转 而是 普通路由跳转
                    //return Get.currentRoute == "Widget的名字";
                    // e.g
                    return Get.currentRoute == "GetXDemos";
                  });
                },
              ),
              Divider(),
              Text("生成一个随机数，验证是否是同一个页面 == ${Random().nextInt(100)}"),
              Divider(),
              TextButton(
                child: Text("pop 关闭所有页面 并打开一个页面 无法跳转到指定页面 Get.offNamedUntil..."),
                onPressed: () {
                  Get.offNamedUntil("/getxDemos",
                      (route) => Get.currentRoute == "/getxDemos");
                },
              ),
            ],
          );
        },
        itemCount: 1,
      ),
    );
  }
}
