import 'package:flutter/material.dart';
import 'package:monthly_pay_user/Common_Widgets/bottom_navigation_bar.dart';
import 'package:monthly_pay_user/Common_Widgets/curve_painter.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      child: Scaffold(
        bottomNavigationBar: BottomBar(currentTab: 0,),
        body: Container(
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
