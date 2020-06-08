import 'package:flutter/material.dart';

import '../Dash_Board/dash_board.dart';
import '../Common_Widgets/bottom_navigation_bar.dart';
import '../Common_Widgets/curve_painter.dart';
import 'widgets/search_delegate.dart';
import 'widgets/transaction_list.dart';
import 'models/TransactionModel.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  Animation animationForTransactionList;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForTransactionList = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  List<CustomerTransaction> _transactionList = [
    CustomerTransaction(
      bank: 'SBI',
      id: '0',
      limit: 350,
      name: 'Shiviani Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '1',
      limit: 350,
      name: 'Rajesh Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '2',
      limit: 350,
      name: 'Sunita Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '3',
      limit: 350,
      name: 'Vivek Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '4',
      limit: 350,
      name: 'Onish Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '5',
      limit: 350,
      name: 'Rhythm Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '6',
      limit: 350,
      name: 'Anshu Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '7',
      limit: 350,
      name: 'Jashan Jaiswal',
      phoneNumber: '1234567890',
    ),
    CustomerTransaction(
      bank: 'SBI',
      id: '8',
      limit: 350,
      name: 'Pushpam Jaiswal',
      phoneNumber: '1234567890',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: GestureDetector(
        onTap: () {
          showSearch(context: context, delegate: TransactionDelegate(transactionList: _transactionList));
        },
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                size: 26,
                color: Colors.grey,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Search Here.. ',style: TextStyle(color: Colors.grey),),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    double _heightOfScreen = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double _widthOfScreen = MediaQuery.of(context).size.width;

    Future<bool> _backPressed() {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DashBoard()));
  }

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return WillPopScope(
          onWillPop: _backPressed,
                  child: Scaffold(
            appBar: _appBar,
            bottomNavigationBar: BottomBar(
              currentTab: 1,
            ),
            body: CustomPaint(
              painter: CurvePainter(),
              child: Transform(
                transform: Matrix4.translationValues(
                  animationForTransactionList.value * _widthOfScreen,
                  0,
                  0,
                ),
                child: Container(
                  height: _heightOfScreen,
                  width: _widthOfScreen,
                  child: TransactionList(
                    transactionList: _transactionList,
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
