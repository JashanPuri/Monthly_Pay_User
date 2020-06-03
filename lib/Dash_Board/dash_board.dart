import 'package:flutter/material.dart';

import 'package:monthly_pay_user/Common_Widgets/bottom_navigation_bar.dart';
import 'package:monthly_pay_user/Common_Widgets/curve_painter.dart';

import 'widgets/amount.dart';
import 'widgets/collection.dart';
import 'widgets/order.dart';
import 'widgets/customer.dart';
import 'widgets/request.dart';
import 'package:monthly_pay_user/Add_Customer/add_customer.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AppBar _appBar = AppBar(
    title: Text('Dashboard'),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
    ],
    elevation: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar,
      bottomNavigationBar: BottomBar(
        currentTab: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                    _Fade(context, AddCustomer());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
          height: _heightOfScreen,
          width: _widthOfScreen,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: _heightOfScreen / 5,
                  width: _widthOfScreen * 0.90,
                  child: Amount(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: _heightOfScreen / 5,
                  width: _widthOfScreen * 0.90,
                  child: Collection(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: _heightOfScreen / 5,
                  width: _widthOfScreen * 0.90,
                  child: Order(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: _heightOfScreen / 5,
                  width: _widthOfScreen * 0.90,
                  child: Customer(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: _heightOfScreen / 5,
                  width: _widthOfScreen * 0.90,
                  child: Request(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _Fade(BuildContext context,Widget widget){
    Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (context,animation,secondaryAnimation){
              return widget;
            },
            transitionsBuilder: (context,animation,secondaryAnimation,child){
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        )
    );
  }
}
