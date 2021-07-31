import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

class AsyncAwaitDemo extends StatelessWidget {
  final List titles = [
    "复杂计算阻塞主Isolate",
    "实现异步的方式",
    "Future Microtask 队列优先级",
    "Isolate"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("async await Future Isolate"),
        actions: [
          Container(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: Colors.yellow,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () {
                switch (index) {
                  case 0:
                    {
                      hardCaculate();
                    }
                    break;
                  case 1:
                    {
                      print("实现异步 start");
                      asyncWay();
                      print("实现异步 end");
                    }
                    break;
                  case 2:
                    {
                      testAsync();
                    }
                    break;
                  case 3:
                    {
                      testIsolate();
                    }
                    break;
                }
              },
              child: Text(titles[index]));
        },
        itemCount: titles.length,
      ),
    );
  }

  asyncWay() async {
    print("异步执行体");
  }

  hardCaculate() {
    for (int i = 0; i < 100000000000000000; i++) {
      print("${i}");
    }
  }

  testAsync() {
    //main执行会创建一个isolate,isolate包含一个事件循环以及两个事件队列，event loop事件循环，以及event queue和microtask queue事件队列
    //优先级规则 每一次的事件循环中 先执行
    //异步操作都会放入队列中，执行顺序和代码顺序无关 比如Microtask在最后声明，但却是最优先执行的
    print("testAsync start");
    //这两个是异步 所以先执行 print("testAsync start");print("testAsync end");
    //这两个被放到event queque中，先进先执行
    Future(() => print("F1"));
    Future(() => print("F2"));
    //??不懂啥意思
    Future(() => null).then((value) => print(
        "Future 函数体是 null，这意味着它不需要也没有事件循环，因此后续的 then 也无法与它共享。在这种场景下，Dart 会把后续的 then 放入微任务队列，在下一次事件循环中执行。"));

    //then:then 与 Future 函数体共用一个事件循环,也就是说Future执行体执行完后会立即执行then
    Future(() => print("F3")).then((value) => print("F3 then"));
    //Future执行体为null时
    Future future = Future(() => print("future var"));
    Future(() => print("F4")).then((value) => print("F4 then"));
    //并不因为位置的改变而改变执行顺序，依然会在nullFuture执行体执行完后立即执行then，并不会晚于F4执行
    future.then((value) => print("future then"));

    //异步中再嵌套声明一个异步任务，嵌套的异步任务会在下一次事件循环中执行，执行依然按照优先级规则执行
    Future(() => Future(() => print("A异步执行体中再声明一个 Future(异步任务)会在下一次事件循环中执行")));
    Future(() => scheduleMicrotask(
        () => print("异步执行体中再声明一个 Microtask(异步任务)会在下一次事件循环中执行")));
    Future(() => Future(() => print("B异步执行体中再声明一个 Future(异步任务)会在下一次事件循环中执行")));

    scheduleMicrotask(() => print("Microtask 我的优先级高多了"));

    print("testAsync end");
    //最后的执行结果
    //testAsync start
    //testAsync end
    //F1
    //F2
  }

  testIsolate() async {
    //创建管道
    ReceivePort port = ReceivePort();
    //关联管道和方法
    Isolate isolate = await Isolate.spawn((SendPort message) {
      // message.send("hello");
    }, port.sendPort);

    port.listen((message) {
      // print("message = ${message}");
    });
  }
}
