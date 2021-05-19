import 'package:flutter/material.dart';
import 'home/home.dart';
import 'package:flutter_app/appdemo/mine.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  List pages = [Home(), Mine(), Home()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedFontSize: 10,
        unselectedItemColor: Color.fromARGB(96, 101, 105, 1),
        selectedFontSize: 10,
        selectedItemColor: Color.fromARGB(215, 185, 129, 1),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("images/home.png"),
              activeIcon: Image.asset("images/homesel.png"),
              label: "Main Page"),
          BottomNavigationBarItem(
              icon: Image.asset("images/Quant.png"),
              activeIcon: Image.asset("images/Quantsel.png"),
              label: "Quant"),
          BottomNavigationBarItem(
              icon: Image.asset("images/mine.png"),
              activeIcon: Image.asset("images/minesel.png"),
              label: "Mine"),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}