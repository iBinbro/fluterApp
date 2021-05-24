import 'package:flutter/material.dart';

class AppSliverBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, box){
          return [SliverAppBar(
            foregroundColor: Colors.red,
            backgroundColor: Colors.green,
            expandedHeight: 200,
            flexibleSpace: Image.asset("images/catesel.png"),
            bottom: TabBar(tabs: tabs),
          )];
        }, body: Container(),
      ),
    );
  }
}
