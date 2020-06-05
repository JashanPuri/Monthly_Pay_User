import 'package:flutter/material.dart';

import '../Dash_Board/dash_board.dart';
import '../Common_Widgets/date_select.dart';
import '../Common_Widgets/bottom_navigation_bar.dart';
import '../Common_Widgets/curve_painter.dart';
import 'widgets/recieved.dart';
import 'widgets/pending.dart';
import 'widgets/bounce.dart';

class Ledger extends StatefulWidget {
  @override
  _LedgerState createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> with SingleTickerProviderStateMixin {
  Animation animationForRecieved, animationForPending, animationForBounce;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForRecieved = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForPending = Tween(begin: 2.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animationForBounce = Tween(begin: 3.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  AppBar _appBar = AppBar(
    title: Text('Ledger'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.share),
        onPressed: () {},
        iconSize: 26,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          icon: Icon(Icons.file_download),
          onPressed: () {},
          iconSize: 26,
        ),
      ),
    ],
    elevation: 0.0,
  );

  Future<bool> _backPressed() {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => DashBoard()));
  }

  @override
  Widget build(BuildContext context) {
    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return WillPopScope(
          onWillPop: _backPressed,
          child: Scaffold(
            appBar: _appBar,
            bottomNavigationBar: BottomBar(
              currentTab: 2,
            ),
            body: CustomPaint(
              painter: CurvePainter(),
              child: Container(
                height: _heightOfScreen,
                width: _widthOfScreen,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: _heightOfScreen * 0.23,
                      child: DateSelect(),
                    ),
                    Positioned(
                      top: _heightOfScreen * 0.22,
                      left: _widthOfScreen * 0.03,
                      child: Container(
                        height: _heightOfScreen * 0.77,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Transform(
                                transform: Matrix4.translationValues(
                                  animationForRecieved.value * _widthOfScreen,
                                  0,
                                  0,
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  height: _heightOfScreen / 2.5,
                                  width: _widthOfScreen * 0.94,
                                  child: RecievedLedger(),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                  animationForPending.value * _widthOfScreen,
                                  0,
                                  0,
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  height: _heightOfScreen / 2.5,
                                  width: _widthOfScreen * 0.94,
                                  child: PendingLedger(),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                  animationForBounce.value,
                                  0,
                                  0,
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  height: _heightOfScreen / 2.5,
                                  width: _widthOfScreen * 0.94,
                                  child: BounceLedger(),
                                ),
                              ),
                              SizedBox(
                                height: _heightOfScreen * 0.08,
                              ),
                            ],
                          ),
                        ),
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
