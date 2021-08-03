import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AsyncAwaitDemo extends StatelessWidget {
  final List titles = [
    "耗时计算阻塞 main Isolate",
    "实现异步的方式",
    "Future Microtask 队列优先级",
    "Isolate",
    "Isolate 实战进行耗时计算",
    "Isolate 通过IsolateNameServer注册以及获取sendport",
    "compute isolate的封装 快速创建isolate并在新isolate执行函数"
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
                  case 4:
                    {
                      testUseIsolate();
                    }
                    break;
                  case 5:
                    {
                      testIsolateNameServer();
                    }
                    break;
                  case 6:
                    {
                      testCompute();
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

  asyncWay() {
    Future(() => print("异步执行体"));
  }

  hardCaculate() {
    for (int i = 0; i < 2000; i++) {
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
    //当前isolate的port 可通过port的sendport向port归属的isolate发送数据
    var mainIsolatePort = new ReceivePort();
    //newSendPort 用来存储新建isolate的sendport
    SendPort? newSendPort;

    //新建的isolate会通过mainisolate的sendport发送自己的sendport

    // //监听mainisolate的port获取传过来的sendport
    // mainIsolatePort.listen((message) {
    //   newSendPort = (message is SendPort) ? (message) : null;
    //   //通过监听我们拿到了新建的isolate的sendport
    //   print("开始通过newisolate的sendport发送数据");
    //   newSendPort?.send("在mainisolate向newisolate发送数据");
    // });

    //传入的函数会被执行,第二个参数是当前isolate的sendport，可用于将新建的isolate的sendport发送出来，
    //通过接收到新创建的isolate的sendport就可以向新建的isolate发数据了
    print("新建newIsolate 这里要await等待spawn完成");
    Isolate newIsolate =
        await Isolate.spawn(entryMethod, mainIsolatePort.sendPort);

    //获取port收到数据的第二个方式 与listen冲突 且必须在spawn后执行 因为获取port是阻塞式，会阻塞后面的代码
    //entryMethod 执行在以下方法后面(原因我也不知道为啥😭)，并不用当心在下面获取port时，entryMethod执行过了导致收不到数据
    print("通过await port first 方式获取newsendport");
    //阻塞当前isolate执行listen port 操作直到获取到了发送的数据
    SendPort awaitNewSendPort = await mainIsolatePort.first;
    awaitNewSendPort.send("await port first 发送数据啦~~");
    print("通过await port first 方式发送了数据");
  }

  testUseIsolate() async {
    var mainPort = ReceivePort();
    mainPort.listen((message) {
      print("收到数据");
      if (message is int) {
        print("最后计算结果 = ${message}");
      }
    });
    await Isolate.spawn(caculateSum, mainPort.sendPort);
  }

  testIsolateNameServer() async {
    print("testIsolateNameServer start");
    var mainPort = ReceivePort();

    IsolateNameServer.removePortNameMapping("testIsolateNameServer");
    IsolateNameServer.registerPortWithName(
        mainPort.sendPort, "testIsolateNameServer");

    Isolate? newIsolate =
        await Isolate.spawn(isolateNameServerCaculateSum, mainPort.sendPort);

    mainPort.listen((message) {
      print("收到数据");
      if (message is int) {
        print("testIsolateNameServer 最后计算结果 = ${message}");
      }

      //计算完成后的销毁
      IsolateNameServer.removePortNameMapping("testIsolateNameServer");
      mainPort.close();
      //关闭Isolate对象
      newIsolate?.kill(priority: Isolate.immediate);
      newIsolate = null;
    });
  }

  testCompute() async {
    int result = await compute(computeCaculateSum, 10000);
    print("testCompute收到的结果 ${result}");
  }
}

int computeCaculateSum(int num) {
  print("computeCaculateSum");

  int j = 0;
  for (int i = 0; i < num; i++) {
    //⚠️❌不要进行频繁的print操作，这会导致出现循环提前终止原因未知
    // print("循环 ${i}");
    j = j + i;
    if (i == num - 1) {
      print("计算出的结果 ${j}");
      return j;
    }
  }
  return 0;
}

//这个要作为顶层函数 不要包含到任何类或者对象里面 参照main函数
isolateNameServerCaculateSum(SendPort sendPort) {
  print("执行isolateNameServerCaculateSum");
  int j = 0;
  for (int i = 0; i < 100000; i++) {
    j = j + i;
    if (i == 99999) {
      //⚠️❌不要进行频繁的print操作，这会导致出现循环提前终止原因未知
      // print("isolateNameServerCaculateSum 计算出的结果 ${j}");
      SendPort? sendPort =
          IsolateNameServer.lookupPortByName("testIsolateNameServer");

      sendPort?.send(j);
    }
  }
  print("执行isolateNameServerCaculateSum end");
}

//这个要作为顶层函数 不要包含到任何类或者对象里面 参照main函数
caculateSum(SendPort sendPort) {
  print("执行caculateSum");

  int j = 0;
  for (int i = 0; i < 10000; i++) {
    //⚠️❌不要进行频繁的print操作，这会导致出现循环提前终止原因未知
    // print("循环 ${i}");
    j = j + i;
    if (i == 9999) {
      print("计算出的结果 ${j}");
      sendPort.send(j);
    }
  }
}

/// 新isolate的入口函数 必须是top-level函数 不属于任何类或者对象(类似于 main 函数，是app的入口)
entryMethod(SendPort mainIsolateSendPort) {
  print("entryMethod 入口函数被执行");
  //创建一个和isolate关联的port
  var port = new ReceivePort();
  //监听向这个port发送的数据
  port.listen((message) {
    print("newIsolate收到的数据=" + message);
  });
  //通过mainisolate的sendport将新建的isolate的sendport发送给mainisolate
  print("将新建的isolate的sendport发送出去");
  mainIsolateSendPort.send(port.sendPort);
}
