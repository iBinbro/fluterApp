import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<String> futureMethod() async {

  //await会阻塞当前线程
  String result = await Future.delayed(Duration(milliseconds: 3), () {
    print("延迟完成后回调");

    // print("返回一个正常结果");
    // return Future.value("正常的结果");

    //****出错则后续代码不会执行 print("return 一个 Future");return result;不会被执行
    Error error = Error();
    throw error;

    return Future.error("丢个错");

  });

  print("return 一个 Future");
  return result;
}

Future<Response> dioRequest() async{

  Response response = await Dio().get("https://v.juhe.cn/toutiao/index?type=shishang&key=483294d5e9b2202317817d0696b47a58");
  return response;

}

class AppAsync extends StatefulWidget {
  @override
  _AppAsyncState createState() => _AppAsyncState();
}

class _AppAsyncState extends State<AppAsync> {

  String? _tip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future、async、await、FutureBuilder"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(_tip??"no data"),
              IconButton(
                  onPressed: () {

                    // futureMethod().then((value) {
                    //   print(value + "=>then");
                    // }).onError((error, stackTrace) {
                    //   //如果实现了onError catchError将不再执行
                    //   print("onError:error=${error.toString()}");
                    // }).catchError((onError) {
                    //   print("catchError");
                    // });

                    dioRequest().then((value) {
                      print("then");
                      setState(() {
                        _tip = value.toString();
                      });
                    }).onError((error, stackTrace) {
                      print("onError");
                    });

                  },
                  icon: Icon(Icons.link)),
            ],
          )
        ],
      ),
    );
  }
}


// class AppAsync extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Future、async、await、FutureBuilder"),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text("data"),
//               IconButton(
//                   onPressed: () {
//
//                     // futureMethod().then((value) {
//                     //   print(value + "=>then");
//                     // }).onError((error, stackTrace) {
//                     //   //如果实现了onError catchError将不再执行
//                     //   print("onError:error=${error.toString()}");
//                     // }).catchError((onError) {
//                     //   print("catchError");
//                     // });
//
//                     dioRequest().then((value) {
//                       print("then");
//                     }).onError((error, stackTrace) {
//                       print("onError");
//                     });
//
//                   },
//                   icon: Icon(Icons.link)),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
