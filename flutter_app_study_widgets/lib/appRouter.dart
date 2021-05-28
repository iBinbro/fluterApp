import 'package:flutter/material.dart';

//由路由传参
class Routerpara extends StatelessWidget {
  String para;

  Routerpara(this.para);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.para),
      ),
      body: IconButton(onPressed: (){
        Navigator.pop(context, "返回参数");
      }, icon: Icon(Icons.arrow_back)),
    );
  }
}

class Test extends StatelessWidget {
  /**定义区域>>>>**/
  String a = "a";
  String b = "b";

  //❌ The instance member 'a' can't be accessed in an initializer.
  //❌ String c = a+b;

  Container container = Container(
      //❌ The instance member 'a' can't be accessed in an initializer.
      //❌ child: Text(a),
      );
  /**<<<<<<定义区域**/

  @override
  Widget build(BuildContext context) {
    Container container = Container(
      //✔️✅
      child: Text(this.a),
    );
    return container;
  }
}
