import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollViewExample extends StatelessWidget {
  ScrollViewExample({Key? key}) : super(key: key);

  List<String> datas = ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text('scrollview'),
      // ),
      child: Center(
        // child: sampleNestedScrollView(context),
        child: sampleGridView(),
      ),
    );
  }

  //最简单的网格样例 GridView;achedNetworkImage网络图片加载
  GridView sampleGridView() {
    return GridView.count(
      childAspectRatio: 0.5,
      crossAxisCount: 2,
      children: List.generate(30, (index) {
        if (index % 3 == 0) {
          return Container(
            color: Colors.blue,
          );
        } else if (index % 3 == 1) {
          return Container(
            color: Colors.yellow,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, imageurl){
                return Image.asset('images/退出登录icon.png');
              },
              imageUrl:
                  'https://upload.jianshu.io/users/upload_avatars/2484771/5b6597d9-59c8-4f7a-9467-754c4add953f.png?imageMogr2/auto-orient/strip|imageView2/1/w/120/h/120',
            ),
          );
        } else {
          return Container(
            color: Colors.purple,
          );
        }
      }),
    );
  }

  //最简单的顶部悬浮效果样例 NestedScrollView
  NestedScrollView sampleNestedScrollView(context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.green, //吸顶效果位置的背景色
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'data',
                style: TextStyle(color: Colors.black),
              ),
              background: Image.asset(
                'images/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      floatHeaderSlivers: true,
      body: createList(context),
    );
  }

  ListView createList(context) {
    ListView listV = ListView.builder(
        padding:
            EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        itemCount: 50,
        itemBuilder: (context, index) {
          return Text('list');
        });
    return listV;
  }
}
