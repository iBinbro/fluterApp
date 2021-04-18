import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

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

  //最简单的网格样例 GridView;
  // CachedNetworkImage网络图片加载
  // FadeInImage网络图片加载
  GridView sampleGridView() {

    PaintingBinding.instance?.imageCache?.clear();

    return GridView.count(
      childAspectRatio: 0.5,
      crossAxisCount: 2,
      children: List.generate(30, (index) {
        if (index % 3 == 0) {
          return Container(
            color: Colors.blue,
            child: FadeInImage.memoryNetwork(//内存占位图
                placeholder: kTransparentImage, //一个渐变效果
                image:
                    'https://tukuimg.bdstatic.com/scrop/6be65a47b2bc49e492385b8ebc486d14.gif'), //网络占位图
          );
        } else if (index % 3 == 1) {
          return Container(
            color: Colors.purple,
            child: FadeInImage.assetNetwork(//本地占位图 占位图可用gif或者普通图片
                // placeholder: 'images/退出登录icon.png',
                placeholder: 'images/imageloadinggif.gif',
                image:
                'https://tukuimg.bdstatic.com/scrop/6be65a47b2bc49e492385b8ebc486d14.gif'),
          );
        } else {
          return Container(
            color: Colors.yellow,
            child: CachedNetworkImage(//本地占位图
              fit: BoxFit.cover,
              placeholder: (context, imageurl) {
                return Image.asset('images/退出登录icon.png');
              },
              imageUrl:
              'https://upload.jianshu.io/users/upload_avatars/2484771/5b6597d9-59c8-4f7a-9467-754c4add953f.png',
            ),
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
