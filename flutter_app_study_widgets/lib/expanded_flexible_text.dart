import 'package:flutter/material.dart';

class ExpandedFlexibleText extends StatelessWidget {
  const ExpandedFlexibleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded_Flexible_Text"),
      ),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Image.asset("images/home.png"),
                      Expanded(
                          child: FittedBox(
                              child: Text(
                        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBB\nBBBBBBBBBBB",
                        style: TextStyle(fontSize: 50),
                      )))
                    ],
                  ))
                ],
              )),
              Row(
                children: [
                  Image.asset("images/home.png"),
                  Text("hellohellohellohellohello")
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
