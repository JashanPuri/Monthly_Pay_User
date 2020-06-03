import 'package:flutter/material.dart';

import '../Dash_Board/dash_board.dart';
import '../Invoice/models/invoice_customers.dart';
import '../Common_Widgets/curve_painter.dart';
import '../Common_Widgets/bottom_navigation_bar.dart';
import 'widgets/customer_card.dart';
import 'widgets/save_button.dart';
import 'widgets/view_list_button.dart';

class Invoice extends StatefulWidget {
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> with SingleTickerProviderStateMixin {
  Animation animationForInvoice;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForInvoice = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  AppBar _appBar = AppBar(
    title: Text('Invoice'),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
    ],
    elevation: 0.0,
  );

  List<InvoiceCustomer> _customers = [
    InvoiceCustomer(name: 'Shivani Jaiswal', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Rajesh Jaiswal', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Ravi Dubey', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vidhu Dubey', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vivek Jaiswal', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vivek Jaiswal', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vivek Jaiswal', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Ravi Dubey', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vidhu Dubey', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vivek Jaiswal', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vivek Jaiswal', amount: 350, limit: 350),
    InvoiceCustomer(name: 'Vivek Jaiswal', amount: 350, limit: 350),
    
  ];

  Future<bool> _backPressed() {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DashBoard()));
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
              currentTab: 3,
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
                          animationForInvoice.value * _widthOfScreen,
                          0,
                          0,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 15),
                          // height: _heightOfScreen * 0.55,
                          width: _widthOfScreen * 0.8,
                          child: CustomerCard(customers: _customers,),
                        ),
                      ),
                      Container(
                        width: _widthOfScreen * 0.5,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: SaveButton(),
                      ),
                      Container(
                        width: _widthOfScreen * 0.5,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: ViewListButton(invoiceCustomers: _customers,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
