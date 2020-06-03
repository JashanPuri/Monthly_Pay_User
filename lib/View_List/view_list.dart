import 'package:flutter/material.dart';
import 'package:monthly_pay_user/Common_Widgets/curve_painter.dart';

class ViewList extends StatefulWidget {
  @override
  _ViewListState createState() => _ViewListState();
}

AppBar _appBar = AppBar(
  title: Text('Invoice List'),
  elevation: 0.0,
);

class _ViewListState extends State<ViewList> {
  @override
  Widget build(BuildContext context) {
    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
          height: _heightOfScreen,
          width: _widthOfScreen,
        ),
      ),
    );
  }
}
