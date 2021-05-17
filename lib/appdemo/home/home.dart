import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: ListView.builder(itemBuilder: (context, index){
        if(index == 0) {

        }
        return
      }),
    );
  }
}

AppBar createAppBar(){
  return AppBar(
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    titleSpacing: 0,
    title: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'images/main_title.png',
                fit: BoxFit.contain,
              ),
              // margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset("images/scan.png")),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset("images/service.png")),
              ],
            )
          ],
        ),
        Text(
          "Home",
          style: TextStyle(color: Colors.red),
        ),
      ],
    ),
  );
}
