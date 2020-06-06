import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class orderInformation extends StatefulWidget {
  @override
  _orderInformationState createState() => _orderInformationState();
}

class _orderInformationState extends State<orderInformation> {
  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      title: Text(
        'Order Information',
        //style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      elevation: 0,
    );
    return Scaffold(
      appBar: _appbar,
    );
  }
  void _Fade(BuildContext context, Widget widget) {
    Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (context, animation, secondaryAnimation,
                child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        )
    );
  }
  }
