import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/circle_wheel_scroll_view.dart';

class WheelExample extends StatelessWidget {
  Widget _buildItem(int i) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 80,
          padding: EdgeInsets.all(10),
          color: Colors.blue[100 * ((i % 8) + 1)],
          child: Center(
            child: Text(
              i.toString(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wheel'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            // height: 260,
            // width: 160,
            child: CircleListScrollView(
              physics: CircleFixedExtentScrollPhysics(),
              axis: Axis.horizontal,
              itemExtent: 20,
              children: List.generate(20, _buildItem),
              radius: MediaQuery.of(context).size.width * 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
