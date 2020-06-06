import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monthly_pay_user/Common_Widgets/bottom_navigation_bar.dart';
import 'package:monthly_pay_user/Common_Widgets/curve_painter.dart';
import 'package:monthly_pay_user/Service_Request/request_class.dart';
import 'dart:io';
class serviceRequest extends StatefulWidget {
  @override
  _serviceRequestState createState() => _serviceRequestState();
}

class _serviceRequestState extends State<serviceRequest> {

  static const descriptionList = <String>['Hold For Month','Till Deactive','Reject'];
  final List<DropdownMenuItem<String>> _dropDownDescriptionItems = descriptionList
      .map(
          (String value) =>
          DropdownMenuItem<String>(
              value: value,
              child: Text(value)
          )
  ).toList();

  List<request_class> NewRequest=[
    request_class(
        name: 'N.D.P.S',
        mobile: 1234567890,
        date: DateTime.now(),
        amount: 500
    ),
    request_class(
        name: 'Shivani Jaiswal',
        mobile: 9876944585,
        date: DateTime.now(),
        amount: 1000
    ),
    request_class(
        name: 'Shivani Jaiswal',
        mobile: 9876944585,
        date: DateTime.now(),
        amount: 600
    )
  ];
  @override
  Widget build(BuildContext context) {
    double h =MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    final appbar = AppBar(
      elevation: 0,
      title: Text(
          'Service Request',
          //style: Theme.of(context).textTheme.headline5
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Colors.white,size: 25,),
        onPressed: Navigator.of(context).pop,
      ),
    );
    return Scaffold(
      appBar: appbar,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
            margin: EdgeInsets.all(w*0.03),
            child: NewRequest.isEmpty ? Text('No Requsts') :
            ListView.builder(
              itemBuilder: (inf,index){
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.symmetric(
                      vertical: h*0.008,
                      horizontal: w*0.01
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                NewRequest[index].name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(NewRequest[index].date),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.phone_android),
                                Text(
                                  NewRequest[index].mobile.toString(),
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                              FittedBox(
                              child: Text(
                                  '₹ ${NewRequest[index].amount.toString()}',
                                  style: Theme.of(context).textTheme.subtitle1
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              height: h*0.05,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(h*0.03)
                              ),
                              child: DropdownButton(
                                underline: SizedBox(),
                                items: _dropDownDescriptionItems,
                                iconSize: 40,
                                hint: Text(descriptionList[0]),
                                onChanged: (value){
                                  setState(() {
                                    NewRequest[index].description = value;
                                  });
                                },
                                value: NewRequest[index].description,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: NewRequest.length,
            )
        ),
      ),
    );
  }
  void _Fade(BuildContext context,Widget widget){
    Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (context,animation,secondaryAnimation){
              return widget;
            },
            transitionsBuilder: (context,animation,secondaryAnimation,child){
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        )
    );
  }
}
