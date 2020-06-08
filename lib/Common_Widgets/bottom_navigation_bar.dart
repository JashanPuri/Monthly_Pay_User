import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monthly_pay_user/profile/profile.dart';
import '../Search/search_page.dart';
import '../Dash_Board/dash_board.dart';
import '../Invoice/invoice.dart';
import '../Ledger/ledger.dart';
import '../profile/profile.dart';
class BottomBar extends StatefulWidget {
  final int currentTab;
  BottomBar({this.currentTab});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _fadeTransition(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
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

  List<Widget> bottomWidgetList = [
    DashBoard(),
    SearchPage(),
    Ledger(),
    Invoice(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    int _currentTab = widget.currentTab;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: BottomNavigationBar(
        onTap: (index) {
          setState(
            () {
              if (_currentTab != index) {
                _fadeTransition(context, bottomWidgetList[index]);
              }
              _currentTab = index;
            },
          );
        },
        currentIndex: _currentTab,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bookOpen,
                size: 25,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.file,
                size: 25,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: SizedBox.shrink()),
        ],
        iconSize: 29,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
