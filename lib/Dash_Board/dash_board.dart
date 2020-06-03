import 'package:flutter/material.dart';

import '../Common_Widgets/bottom_navigation_bar.dart';
import '../Common_Widgets/curve_painter.dart';
import 'widgets/amount.dart';
import 'widgets/collection.dart';
import 'widgets/order.dart';
import 'widgets/customer.dart';
import 'widgets/request.dart';

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> b6b7d215649fcbbbf584bf979c070481d7708998
>>>>>>> ac6f9cce21593c4d1220092a80008443cbfa0666
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> ac6f9cce21593c4d1220092a80008443cbfa0666
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
<<<<<<< HEAD
=======
=======
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
        onPressed: () {},
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
>>>>>>> b6b7d215649fcbbbf584bf979c070481d7708998
>>>>>>> ac6f9cce21593c4d1220092a80008443cbfa0666
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

  @override
  Widget build(BuildContext context) {
    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          appBar: _appBar,
          bottomNavigationBar: BottomBar(
            currentTab: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
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
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
