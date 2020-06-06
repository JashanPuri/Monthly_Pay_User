import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:monthly_pay_user/Common_Widgets/curve_painter.dart';
import './add_photo.dart';
class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        'Add New Customer',
        //style: Theme.of(context).textTheme.headline5,
      ),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      elevation: 0,
    );
    final h = MediaQuery
        .of(context)
        .size
        .height - MediaQuery
        .of(context)
        .padding
        .top - appbar.preferredSize.height;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: appbar,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
          //padding: EdgeInsets.only(left: w * 0.03, right: w * 0.03),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                            child: Text('Name', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8,
                                right: 8,
                                top: 8,
                                bottom: 10),
                            width: w * 0.95,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter Full Name',
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  SizedBox(height: h * 0.03,),
                  Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Address Detail', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: w * 0.95,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Address',
                              ),
                            ),
                          ),
                        Container(
                          width: w*0.9,
                          child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: this._typeAheadController,
                              decoration: InputDecoration(
                                  labelText: 'State'
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
                          Container(
//                            padding: EdgeInsets.only(
//                                left: 8, right: 8, top: 8, bottom: 10),
                           width: w * 0.9,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'District',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
                            width: w * 0.95,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: w * 0.36,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'City',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.36,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Tehsil',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 10),
                            width: w * 0.9,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Pin',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: h * 0.03,),
                  Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Contact Detail', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: w * 0.95,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'E-mail Address',
                                suffixIcon: Icon(Icons.mail)
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8,
                                right: 8,
                                top: 8,
                                bottom: 10),
                            width: w * 0.9,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Mobile',
                                suffixIcon: Icon(Icons.phone_android)
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                    height: h*0.06,
                    color: Colors.grey[100],
                    child: GestureDetector(
                      onTap: () {
                        _Fade(context, Add_Photo());
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
          ),
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
  static final List<String> states = [
    'ANDAMAN AND NICOBAR ISLANDS',
    'ANDHRA PRADESH',
    'ARUNACHAL PRADESH',
    'ASSAM',
    'BIHAR',
    'CHATTISGARH',
    'CHANDIGARH',
    'DAMAN AND DIU',
    'DELHI',
    'DADRA AND NAGAR HAVELI',
    'GOA',
    'GUJARAT',
    'HIMACHAL PRADESH',
    'HARYANA',
    'JAMMU AND KASHMIR',
    'JHARKHAND',
    'KERALA',
    'KARNATAKA',
    'LAKSHADWEEP',
    'MEGHALAYA',
    'MAHARASHTRA',
    'MANIPUR',
    'MADHYA PRADESH',
    'MIZORAM',
    'NAGALAND',
    'ORISSA',
    'PUNJAB',
    'PONDICHERRY',
    'RAJASTHAN',
    'SIKKIM',
    'TAMIL NADU',
    'TRIPURA',
    'UTTARAKHAND',
    'UTTAR PRADESH',
    'WEST BENGAL',
    'TELANGANA'
  ];


  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}