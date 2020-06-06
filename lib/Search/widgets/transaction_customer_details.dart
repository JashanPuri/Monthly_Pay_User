import 'package:flutter/material.dart';

import '../../Search/models/TransactionModel.dart';
import 'transaction_details_page.dart';

class TransactionCustomerDetails extends StatefulWidget {
  final CustomerTransaction customer;
  final Image customerImage;
  TransactionCustomerDetails({this.customer, this.customerImage});

  @override
  _TransactionCustomerDetailsState createState() =>
      _TransactionCustomerDetailsState();
}

class _TransactionCustomerDetailsState
    extends State<TransactionCustomerDetails> {
  var _appBar = AppBar(
    elevation: 0,
    title: Text(
      'Customer Details',
    ),
  );

  Image _image;

  void _fadeTransitionWithPush(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(
          milliseconds: 600,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    var _customer = widget.customer;

    var _theme = Theme.of(context);

    return Scaffold(
      appBar: _appBar,
      body: Container(
        height: _heightOfScreen,
        width: _widthOfScreen,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: _heightOfScreen * 0.37,
              width: _widthOfScreen,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(40, 30),
                    bottomLeft: Radius.elliptical(40, 30)),
              ),
            ),
            Column(
              children: <Widget>[
                Hero(
                  tag: _customer.id,
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: _heightOfScreen * 0.25,
                      width: _heightOfScreen * 0.25,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(_heightOfScreen * 0.125),
                      ),
                      child: widget.customerImage),
                ),
                Text(
                  _customer.name,
                  style: _theme.textTheme.headline6.copyWith(
                    color: _theme.accentColor,
                    fontSize: 40,
                  ),
                )
              ],
            ),
            Positioned(
              top: _heightOfScreen * 0.37,
              child: Container(
                height: _heightOfScreen * 0.63,
                width: _widthOfScreen * 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Customer Id:',
                                  textAlign: TextAlign.center,
                                  style: _theme.textTheme.subtitle1
                                      .copyWith(fontSize: 27),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  _customer.id,
                                  style: _theme.textTheme.subtitle2
                                      .copyWith(fontSize: 23),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Limit:',
                                  textAlign: TextAlign.center,
                                  style: _theme.textTheme.subtitle1
                                      .copyWith(fontSize: 27),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  _customer.limit.toString(),
                                  style: _theme.textTheme.subtitle2
                                      .copyWith(fontSize: 23),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Frequency:',
                                  textAlign: TextAlign.center,
                                  style: _theme.textTheme.subtitle1
                                      .copyWith(fontSize: 27),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Monthly/Ad-hoc',
                                  style: _theme.textTheme.subtitle2
                                      .copyWith(fontSize: 23),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  'End Date:',
                                  textAlign: TextAlign.center,
                                  style: _theme.textTheme.subtitle1
                                      .copyWith(fontSize: 27),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Till Cancel/Till Date',
                                      style: _theme.textTheme.subtitle2
                                          .copyWith(fontSize: 23),
                                    ),
                                    Text(
                                      'MM-YYYY',
                                      style: _theme.textTheme.subtitle2
                                          .copyWith(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Bank:',
                                  textAlign: TextAlign.center,
                                  style: _theme.textTheme.subtitle1
                                      .copyWith(fontSize: 27),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  _customer.bank,
                                  style: _theme.textTheme.subtitle2
                                      .copyWith(fontSize: 23),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: FlatButton.icon(
                          onPressed: () {
                            _fadeTransitionWithPush(
                                context,
                                TransactionDetailsPage(
                                  customerTDetails: _customer,
                                ));
                          },
                          icon: Icon(
                            Icons.description,
                            color: _theme.accentColor,
                            size: 28,
                          ),
                          label: Text(
                            'Transaction Details',
                            style: _theme.textTheme.headline5,
                          ),
                          color: _theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
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
    );
  }
}
