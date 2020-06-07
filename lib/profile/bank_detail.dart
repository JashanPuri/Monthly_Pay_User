import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:monthly_pay_user/Dash_Board/dash_board.dart';
import 'package:monthly_pay_user/profile/authorized_person_detail.dart';

class bankDetail extends StatefulWidget {
  @override
  _bankDetailState createState() => _bankDetailState();
}

class _bankDetailState extends State<bankDetail> {
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     final appbar = AppBar(
      title: Text('Bank Detail'),
       actions: [
         IconButton(
           icon: Icon(Icons.home),
           onPressed: (){
             _Fade(context, DashBoard());
           },
         )
       ],
    );
    final h= MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top;
    final w= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height:h,
              margin: EdgeInsets.only(left: 8,right: 8),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  tile(context,'Bank Name'),
                  tile(context,'Account Type'),
                  tile(context,'Amount Number'),
                  tile(context,'IFSC Code'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          'State',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontFamily: 'BenchNine'
                          )
                      ),
                      TypeAheadField(
                        direction: AxisDirection.up,
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: this._typeAheadController,
                          ),
                          suggestionsCallback: (pattern) async {
                            return await StateService.getSuggestions(pattern);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            this._typeAheadController.text = suggestion;
                          }),
                    ],
                  ),
                  tile(context,'Branch'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Recieved Amount',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                              fontFamily: 'BenchNine'
                          )
                      ),
                      Container(
                        width: w*0.45,
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
                    ],
                  ),
                  FlatButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(h*0.05)
                        ),
                        child: Text('Save Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              height: h*0.06,
              color: Colors.grey[100],
              child: GestureDetector(
                onTap: () {
                   _Fade(context, authorizedPersonPage());
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

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'name': query + index.toString()};
    });
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

