import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:monthly_pay_user/Common_Widgets/curve_painter.dart';
import './add_photo.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  static const statesList = <String>[
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
  final List<DropdownMenuItem<String>> _dropDownStateItems = statesList
      .map(
          (String value) =>
          DropdownMenuItem<String>(
              value: value,
              child: Text(value)
          )
  ).toList();
  String _selectedState;

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
        .top - appbar.preferredSize.height ;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: appbar,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Container(
          height:  h ,
          width: w,
          padding: EdgeInsets.only(left: w * 0.03, right: w * 0.03,),
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
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 10),
                          width: w * 0.9,
                          height: w*0.25,
                          child: DropdownButton(
                            items: _dropDownStateItems,
                            iconSize: 40,
                            hint: Text('State'),
                            onChanged: (value){
                              setState(() {
                                _selectedState = value;
                              });
                            },
                            value: _selectedState,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 10),
                          width: w * 0.9,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'District',
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
                              hintText: 'Pin',
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
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: () {
                          _Fade(context, Add_Photo());
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
                          _Fade(context, Add_Photo());
                        },
                      )
                    ],
                  ),
                )
              ],
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
