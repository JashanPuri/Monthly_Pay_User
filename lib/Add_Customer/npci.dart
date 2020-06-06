import 'package:flutter/material.dart';
import 'package:monthly_pay_user/Add_Customer/order_information.dart';

class npci extends StatefulWidget {
  @override
  _npciState createState() => _npciState();
}

class _npciState extends State<npci> {
  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      title: Text(
        'NPCI',
        //style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      elevation: 0,
    );
    return Scaffold(
      appBar: _appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _Fade(context, orderInformation());
        },
        backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.navigate_next),
      ),
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
