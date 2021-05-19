import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: Padding(
          child: Image.asset('images/buycarsel.png'),
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        ),
        actions: [IconButton(onPressed: (){}, icon: Image.asset("images/buycarsel.png"))],
      ),
    );
  }
}