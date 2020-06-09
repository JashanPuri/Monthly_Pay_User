import 'package:flutter/material.dart';
import 'package:monthly_pay_user/Dash_Board/dash_board.dart';

import 'bank_detail.dart';
class statutoryDetail extends StatefulWidget {
  @override
  _statutoryDetailState createState() => _statutoryDetailState();
}

class _statutoryDetailState extends State<statutoryDetail> {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text('Statutory Detail'),
      actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: (){
            _fadeBackToHome(context, DashBoard());
          },
        )
      ],
    );
    final h= MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top;
    //final w= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height:h*0.87,
              margin: EdgeInsets.only(left: 8,right: 8),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  tile(context,'Registration Type'),
                  tile(context,'Registration Number'),
                  tile(context,'GST Number'),
                  tile(context,'PAN Number '),
                  tile(context,'TAX Number'),
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).primaryColor,
                    onPressed: (){},
                    child: Text(
                      'Save Details',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: h*0.06,
              color: Colors.grey[100],
              child: GestureDetector(
                onTap: () {
                   _Fade(context, bankDetail());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Next  ',
                        style: Theme.of(context).textTheme.subtitle1
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _Fade(BuildContext context, Widget widget) {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }
  
void _fadeBackToHome(BuildContext context, Widget widget) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }
}

void _fadeBackToHome(BuildContext context, Widget widget) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }


Widget tile(BuildContext context,String str){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
          str,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontFamily: 'BenchNine'
          )
      ),
      TextField(
        decoration: InputDecoration(
          //labelText: str,
        ),
      ),
    ],
  );
}
