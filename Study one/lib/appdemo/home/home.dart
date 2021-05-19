import 'package:flutter/material.dart';
import 'package:flutter_app/appdemo/home/bin_banner.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List banners = ["1", "2", "3", "4"];

    double bannerHeight =
        (MediaQuery.of(context).size.width - 20 * 2) * 150 / 335;

    return Scaffold(
      appBar: createAppBar(),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.blue,
                  expandedHeight: (bannerHeight + 20)+kTextTabBarHeight,
                  pinned: true,
                  flexibleSpace: Container(
                    //banner
                    width: MediaQuery.of(context).size.width,
                    height: (bannerHeight + 20),
                    child: BinBanner(banners, bannerHeight),
                  ),
                  toolbarHeight: 0,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(kTextTabBarHeight+0.5),
                    child: Material(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Color.fromARGB(255, 215, 185, 129),
                        labelStyle: TextStyle(fontSize: 15),
                        unselectedLabelColor: Color.fromARGB(255, 96, 101, 105),
                        unselectedLabelStyle: TextStyle(fontSize: 14),
                        indicatorColor: Color.fromARGB(255, 215, 185, 129),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 2.5,
                        tabs: [
                          Tab(
                            text: "排行榜",
                          ),
                          Tab(
                            text: "排行榜",
                          ),
                          Tab(
                            text: "排行榜",
                          ),
                        ],
                        onTap: (index) {

                        },
                      ),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 1) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CoinRateGrid("ETH/USDT", "1578.11", "≈¥10230.13"),
                          CoinRateGrid("ETH/USDT", "1578.11", "≈¥10230.13"),
                          CoinRateGrid("ETH/USDT", "1578.11", "≈¥10230.13"),
                        ],
                      );
                    }
                    return ListTile(
                      title: Text("cell"),
                    );
                  },
                  itemCount: 3,
                ),
                Text("data"),
                Text("data"),
              ],
            )),
      ),
    );
  }
}

class CoinRateGrid extends StatelessWidget {
  String coinType;
  String num;
  String price;

  CoinRateGrid(this.coinType, this.num, this.price);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(coinType),
        Text(num),
        Text(price),
      ],
    );
  }
}

AppBar createAppBar() {
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
                    onPressed: () {}, icon: Image.asset("images/scan.png")),
                IconButton(
                    onPressed: () {}, icon: Image.asset("images/service.png")),
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
