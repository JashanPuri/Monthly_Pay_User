import 'package:flutter/material.dart';
import 'package:monthly_pay_user/Common_Widgets/curve_painter.dart';
import 'package:monthly_pay_user/Invoice/models/invoice_customers.dart';

import 'widgets/invoice_list_tiles.dart';

class ViewList extends StatefulWidget {
  final List<InvoiceCustomer> invoiceCustomers;
  ViewList({@required this.invoiceCustomers});

  @override
  _ViewListState createState() => _ViewListState();
}

class _ViewListState extends State<ViewList>
    with SingleTickerProviderStateMixin {
  Animation animationForInvoiceList;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForInvoiceList = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  AppBar _appBar = AppBar(
    title: Text('Invoice List'),
    elevation: 0.0,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.share),
        onPressed: () {},
        iconSize: 25,
      ),
      IconButton(
        icon: Icon(Icons.file_download),
        onPressed: () {},
        iconSize: 25,
      ),
      IconButton(
        icon: Icon(Icons.send),
        onPressed: () {},
        iconSize: 25,
      ),
    ],
  );

  double get _totalamount {
    double amount = 0;
    for (int i = 0; i < widget.invoiceCustomers.length; i++) {
      amount += widget.invoiceCustomers[i].amount;
    }

    return amount;
  }

  @override
  Widget build(BuildContext context) {
    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, constraints) {
          return Scaffold(
            appBar: _appBar,
            body: CustomPaint(
              painter: CurvePainter(),
              child: Container(
                height: _heightOfScreen,
                width: _widthOfScreen,
                child: Column(
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(
                        animationForInvoiceList.value * _widthOfScreen,
                        0,
                        0,
                      ),
                      child: Container(
                        height: _heightOfScreen * 0.93,
                        width: _widthOfScreen * 0.93,
                        child: InvoiceListTile(
                          invoiceCustomers: widget.invoiceCustomers,
                        ),
                      ),
                    ),
                    Container(
                      height: _heightOfScreen * 0.07,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Total: ',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 25),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                '$_totalamount',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.grey[600], fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
