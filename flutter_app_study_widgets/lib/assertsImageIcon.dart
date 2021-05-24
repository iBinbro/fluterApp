import 'package:flutter/material.dart';

class ImageDisplayExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assets、Images、Icon"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 100,
            child: Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
          );
        },
        itemCount: 1,
      ),
    );
  }
}
