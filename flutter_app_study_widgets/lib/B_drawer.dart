import 'package:flutter/material.dart';

class B_drawer{

  static Drawer get drawer{
    return Drawer(

      child: ListView.builder(itemBuilder: (context, index){
        if(index == 0){
          return IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Image.asset("images/back.png"));
        }
        return ListTile(
          title: Text("title"),
        );
      }),
    );
  }

  static Drawer get endDrawer{
    return Drawer(
      child: ListView.builder(itemBuilder: (context, index){
        if(index == 0){
          return IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Image.asset("images/back.png"));
        }
        return ListTile(
          title: Text("title"),
        );
      }),
    );
  }

}
