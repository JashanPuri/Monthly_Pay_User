import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

import 'npci.dart';

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
  final TextEditingController _typeAheadController = TextEditingController();

  static const frequencyList = <String>['Monthly','Adhoc'];
  final List<DropdownMenuItem<String>> _dropDownFrequencyItems = frequencyList
      .map(
          (String value) =>
          DropdownMenuItem<String>(
              value: value,
              child: Text(value)
          )
  ).toList();

  static const endDateList = <String>['Till Cancel','Till Date'];
  final List<DropdownMenuItem<String>> _dropDownEndDateItems = endDateList
      .map(
          (String value) =>
          DropdownMenuItem<String>(
              value: value,
              child: Text(value)
          )
  ).toList();

  static const transactionTypeList = <String>['Fixed','Flexible'];
  final List<DropdownMenuItem<String>> _dropDownTransactionTypeItems = transactionTypeList
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
        lastDate: DateTime(2040)
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
          body:SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: w*0.9,
                    height: h,
                    margin: EdgeInsets.only(left: 8,right: 8,top: 8),
                    decoration: BoxDecoration(

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          title: Text(
                            'Limit',
                          style: Theme.of(context).textTheme.headline6,
                          ),
                          trailing: Container(
                            width: w*0.6,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'e.g 500',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(h*0.03)
                                  )
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
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
                        Divider(
                          thickness: 2,
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Transaction  Date   (Between)',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      _presentDatePicker(0);
                                    },
                                    child: Container(
                                      height: h*0.06,
                                      width: w*0.3,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(h*0.03)
                                      ),
                                      child: _fromDate==null ? Text('From',style: Theme.of(context).textTheme.subtitle2,)
                                          :Text(DateFormat.yMMMd().format(_fromDate),style: Theme.of(context).textTheme.subtitle2,),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      _presentDatePicker(1);
                                    },
                                    child: Container(
                                      height: h*0.06,
                                      width: w*0.3,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(h*0.03)
                                      ),
                                      child: _toDate==null ? Text('To',style: Theme.of(context).textTheme.subtitle2,)
                                          :Text(DateFormat.yMMMd().format(_toDate),style: Theme.of(context).textTheme.subtitle2,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Container(
                          child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'End Date',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: h*0.06,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(h*0.03)
                                  ),
                                  child: DropdownButton(
                                    underline: SizedBox(),
                                    items: _dropDownEndDateItems,
                                    iconSize: 40,
                                    hint: Text(endDateList[0]),
                                    onChanged: (value){
                                      setState(() {
                                        _endDateType = value;
                                      });
                                    },
                                    value: _endDateType,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    _presentDatePicker(2);
                                  },
                                  child: Container(

                                    height: h*0.06,
                                    width: w*0.3,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(h*0.03)
                                    ),
                                    child: _endDate==null ? Text('End Date',style: Theme.of(context).textTheme.subtitle2,)
                                        :Text(DateFormat.yMMMd().format(_endDate),style: Theme.of(context).textTheme.subtitle2,),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        ListTile(
                          title: Text(
                            'Transaction Type',
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
                              items: _dropDownTransactionTypeItems,
                              iconSize: 40,
                              hint: Text(transactionTypeList[0]),
                              onChanged: (value){
                                setState(() {
                                  _transactionType= value;
                                });
                              },
                              value: _transactionType,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        ListTile(
                              title: Text('Bank',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                          trailing: Container(
                            width: w*0.6,
                            child: TypeAheadFormField(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: this._typeAheadController,
                                  decoration: InputDecoration(
                                      hintText: 'eg. SBI',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(h*0.04)
                                      )
                                  ),
                                ),
                                suggestionsCallback: (pattern) async{
                                  return await StateService.getSuggestions(pattern);
                                },
                                transitionBuilder: (context , suggestionBox,controller){
                                  return suggestionBox;
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  this._typeAheadController.text = suggestion;
                                }
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                      thickness: 0,color: Colors.white,
                  ),
                  Container(
                    height: h*0.06,
                    color: Colors.grey[100],
                    child: GestureDetector(
                      onTap: () {
                        _Fade(context, npci());
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

class StateService {
  static final List<String> banks = [
    'SBI',
    'Axis Bank',
    'Union Bank'
  ];


  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(banks);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}