import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TextField TextFormField"),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(

              //光标颜色
              cursorColor: Colors.yellow,

              //键盘类型
              keyboardType: TextInputType.name,

              decoration: InputDecoration(
                //占位文字及属性
                hintText: "请输入手机号",
                hintStyle: TextStyle(color: Colors.grey),
                hintTextDirection: TextDirection.ltr,

                // 去除默认带的边框
                border: InputBorder.none,

                //前置图标
                icon: Image.asset("images/service.png"),

                //头占位图标会一直显示
                prefixIcon: Image.asset("images/minesel.png"),
                prefixIconConstraints: BoxConstraints(minWidth: 40),

                //头占位限制 编辑状态显示
                prefix: Image.asset("images/catesel.png"),

                //尾占位图标会一直显示
                suffixIcon: Image.asset("images/minesel.png"),
                suffixIconConstraints: BoxConstraints(minWidth: 40),

                //尾占位限制 编辑状态显示
                suffix: Image.asset("images/catesel.png"),
              ),
            ),
          ),
        ));
  }
}
