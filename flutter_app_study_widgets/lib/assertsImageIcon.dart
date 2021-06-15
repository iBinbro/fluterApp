import 'package:cached_network_image/cached_network_image.dart';
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
            child: CachedNetworkImage(
              //本地占位图
              fit: BoxFit.cover,
              placeholder: (context, imageurl) {
                return Image.asset(
                  'images/home.png',
                  fit: BoxFit.cover,
                );
              },
              errorWidget: (context, url, error) {
                return Image.asset(
                  'images/home.png',
                  fit: BoxFit.cover,
                );
              },
              imageUrl: "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
            ),
          );
        },
        itemCount: 1,
      ),
    );
  }
}
