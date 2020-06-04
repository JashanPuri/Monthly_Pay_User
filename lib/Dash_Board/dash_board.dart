import 'package:flutter/material.dart';

import '../Common_Widgets/bottom_navigation_bar.dart';
import '../Common_Widgets/curve_painter.dart';
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

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  Animation animationForAmount,
      animationForCollection,
      animationForOrder,
      animationForCustomer,
      animationForRequest;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForAmount = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForCollection = Tween(begin: 2.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForOrder = Tween(begin: 3.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForCustomer = Tween(begin: 4.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForRequest = Tween(begin: 5.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  AppBar _appBar = AppBar(
    title: Text('Dashboard'),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
    ],
    elevation: 0.0,
  );

  Future<bool> _backPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you really want to exit the app ?'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      'Yes',
                      style: TextStyle(fontSize: 20),
                    )),
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'No',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ));
  }

  void _Fade(BuildContext context, Widget widget) {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

<<<<<<< HEAD
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return WillPopScope(
            onWillPop: _backPressed,
            child: Scaffold(
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
                    child: Column(children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                          animationForAmount.value * _widthOfScreen,
                          0,
                          0,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: _heightOfScreen / 5,
                          width: _widthOfScreen * 0.90,
                          child: Amount(),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                          animationForCollection.value * _widthOfScreen,
                          0,
                          0,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: _heightOfScreen / 5,
                          width: _widthOfScreen * 0.90,
                          child: Collection(),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                          animationForOrder.value * _widthOfScreen,
                          0,
                          0,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: _heightOfScreen / 5,
                          width: _widthOfScreen * 0.90,
                          child: Order(),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                          animationForCustomer.value * _widthOfScreen,
                          0,
                          0,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: _heightOfScreen / 5,
                          width: _widthOfScreen * 0.90,
                          child: Customer(),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                          animationForRequest.value * _widthOfScreen,
                          0,
                          0,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: _heightOfScreen / 5,
                          width: _widthOfScreen * 0.90,
                          child: Request(),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          );
        });
=======
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
            child: Column(children: <Widget>[
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
              ),
            ]),
          ),
        ),
      ),
    );
>>>>>>> 0bca13b924e7044efa39c73c20b23505365bc7fd
  }
}
