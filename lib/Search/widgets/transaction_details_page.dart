import 'package:flutter/material.dart';

import '../../Common_Widgets/curve_painter.dart';
import '../../Common_Widgets/date_select.dart';
import '../models/TransactionModel.dart';
import 'transaction_details_widgets/bounce_transactions.dart';
import 'transaction_details_widgets/hold_transactions.dart';
import 'transaction_details_widgets/pending_transactions.dart';
import 'transaction_details_widgets/recieved_transaction.dart';

class TransactionDetailsPage extends StatefulWidget {
  final CustomerTransaction customerTDetails;
  TransactionDetailsPage({this.customerTDetails});

  @override
  _TransactionDetailsPageState createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage>
    with SingleTickerProviderStateMixin {
  Animation animationForRecieved,
      animationForPending,
      animationForBounce,
      animationForHold;
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
    animationForHold = Tween(begin: 4.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      elevation: 0,
      title: Text("Transaction Details"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.share), onPressed: () {}),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(icon: Icon(Icons.file_download), onPressed: () {}),
        ),
      ],
    );

    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    var _theme = Theme.of(context);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          appBar: _appBar,
          body: CustomPaint(
            painter: CurvePainter(),
            child: Container(
              height: _heightOfScreen,
              width: _widthOfScreen,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: _widthOfScreen * 0.05,
                    child: Container(
                      height: _heightOfScreen * 0.1,
                      width: _widthOfScreen * 0.9,
                      alignment: Alignment.center,
                      child: Text(
                        widget.customerTDetails.name,
                        overflow: TextOverflow.ellipsis,
                        style: _theme.textTheme.headline6
                            .copyWith(color: _theme.accentColor),
                      ),
                    ),
                  ),
                  Positioned(
                    top: _heightOfScreen * 0.08,
                    child: Container(
                      height: _heightOfScreen * 0.2,
                      width: _widthOfScreen,
                      child: DateSelect(),
                    ),
                  ),
                  Positioned(
                    top: _heightOfScreen * 0.28,
                    left: _widthOfScreen * 0.03,
                    child: Container(
                      height: _heightOfScreen * 0.72,
                      width: _widthOfScreen * 0.94,
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
                                child: RecievedTransaction(),
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
                                child: PendingTransaction(),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                animationForBounce.value * _widthOfScreen,
                                0,
                                0,
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                height: _heightOfScreen / 2.5,
                                width: _widthOfScreen * 0.94,
                                child: BounceTransaction(),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                animationForHold.value * _widthOfScreen,
                                0,
                                0,
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                height: _heightOfScreen / 2.5,
                                width: _widthOfScreen * 0.94,
                                child: HoldTransaction(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
