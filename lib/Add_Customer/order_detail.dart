import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class orderDetail extends StatefulWidget {
  @override
  _orderDetailState createState() => _orderDetailState();
}

class _orderDetailState extends State<orderDetail> {
  String _selectedFrequency;
  String _endDateType;
  String _transactionType;
  DateTime _fromDate;
  DateTime _toDate;
  DateTime _endDate;

  static const frequencyList = <String>['Monthly','Adhoc'];
  final List<DropdownMenuItem<String>> _dropDownFrequencyItems = frequencyList
      .map(
          (String value) =>
          DropdownMenuItem<String>(
              value: value,
              child: Text(value)
          )
  ).toList();

  void _presentDatePicker(int k){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate==null){
        return;
      }
      if(k==0)
      {
        setState(() {
          _fromDate = pickedDate;
        });
      }
      else if(k==1)
      {
        setState(() {
          _toDate = pickedDate;
        });
      }
      else
      {
        setState(() {
          _endDate = pickedDate;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      title: Text(
        'Order Detail',
        //style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      elevation: 0,
    );
    double h = MediaQuery.of(context).size.height -
        _appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
          appBar: _appbar,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: w*0.9,
                  height: h*0.9,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(

                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Limit',
                        style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: Container(
                          width: w*0.6,
                          height: h*0.06,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'e.g 500',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(h*0.03)
                                )
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                            'Frequency',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: Container(
                          padding: EdgeInsets.all(8),
                          height: h*0.06,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(h*0.03)
                          ),
                          child: DropdownButton(
                            underline: SizedBox(),
                            items: _dropDownFrequencyItems,
                            iconSize: 40,
                            hint: Text(frequencyList[0]),
                            onChanged: (value){
                              setState(() {
                                _selectedFrequency = value;
                              });
                            },
                            value: _selectedFrequency,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Transaction  Date   (Between)',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: h*0.06,
                            width: w*0.3,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(h*0.03)
                            ),
                            child: _fromDate==null ? Text('From'):Text(DateFormat.yMMMd().format(_fromDate),style: Theme.of(context).textTheme.subtitle2,),
                          ),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: (){
                              _presentDatePicker(0);
                            },
                          ),
                          Container(
                            height: h*0.06,
                            width: w*0.3,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(h*0.03)
                            ),
                            child: _toDate==null ? Text('To'):Text(DateFormat.yMMMd().format(_toDate),style: Theme.of(context).textTheme.subtitle2,),
                          ),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: (){
                              _presentDatePicker(1);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: () {
                          //_Fade(context, Add_Photo());
                        },
                        child: Text(
                            'Next',
                            style: Theme.of(context).textTheme.subtitle1
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios, color: Colors.black,),
                        onPressed: () {
                         // _Fade(context, Add_Photo());
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
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
