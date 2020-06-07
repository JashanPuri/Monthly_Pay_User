import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:monthly_pay_user/Dash_Board/dash_board.dart';

class authorizedPersonPage extends StatefulWidget {
  @override
  _authorizedPersonState createState() => _authorizedPersonState();
}

class _authorizedPersonState extends State<authorizedPersonPage> {
  String name;
  File _image;
  String MobNum;
  final TextEditingController _typeAheadController = TextEditingController();
  int _currentTab = 3;

  Future getImage(int k) async{
    if(k==0){
      final image = await ImagePicker.pickImage(source: ImageSource.camera);
      if (image!=null)
      {
        setState(() {
          _image=image;
        });
      }
    }
    else{
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image!=null)
      {
        setState(() {
          _image=image;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final h= MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title:
          Text('Authorized Person Detail', style: Theme
              .of(context)
              .textTheme
              .headline5),
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          actions: [
            FlatButton(
              child: Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                _Fade(context, DashBoard());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(40, 30),
                          bottomLeft: Radius.elliptical(40, 30)),
                      color: Colors.lightBlue),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _startAddNewTransaction(context);
                      },
                      child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60)),
                          child: _image != null
                              ? new Container(
                              width: 190.0,
                              height: 190.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(_image))))
                              : Stack(
                            children: [
                              Container(
                                  width: h*0.24,
                                  height: h*0.24,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: _image!=null ? FileImage(_image)
                                              : AssetImage('assets/images/account_img.jpg')
                                      )
                                  )),
                              Positioned(
                                left: 100,
                                top: 100,
                                child: CircleAvatar(
                                    child: IconButton(
                                        onPressed: (){
                                           _startAddNewTransaction(context);
                                           },
                                        icon: Icon(Icons.edit))),
                              )
                            ],
                          )),
                    ),
                    name != null && name != ' '
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Text(
                          name,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5,
                        ),
                      ],
                    )
                        : Text(
                      '',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline5,
                    )
                  ],
                ),
              ]),
              ListTile(
                  title: Text(
                    'Name',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
                  ),
                  subtitle: TextField(
                    decoration: InputDecoration(
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .subtitle2,
                        hintText: 'Full Name'),
                    onSubmitted: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  )),
              SizedBox(height: 20),
              ListTile(
                subtitle: Column(
                  children: [
                    Text(
                      'Add Mobile Number',
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 22),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintStyle:
                                Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle2,
                                hintText: 'Mobile Number'),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                MobNum = value;
                              });
                            },
                            onSubmitted: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.add_circle),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                title: Text(
                  'Address Detail',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(labelText: 'State'),
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
                    tile(context, 'District'),
                    tile(context, 'Tehsil'),
                    tile(context, 'City'),
                    tile(context, 'Pin'),
                    tile(context, 'Landmark'),
                    tile(context, 'Email'),
                    SizedBox(height: h*0.02,)
                  ],
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).primaryColor,
                onPressed: (){},
                child: Text(
                  'Save Details',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: h*0.02,)
            ],
          ),
        ),
    );
  }

  void _startAddNewTransaction(BuildContext ctx){
    double h = MediaQuery.of(ctx).size.height;
    showModalBottomSheet(context: ctx, builder: (_){
      return Container(
        height: h*0.22,
        padding: EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: (){},
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      getImage(0);
                    },
                    child: Container(
                        height: h*0.14,
                        width: h*0.14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(h*0.07),
                          color: Colors.grey,
                        ),
                        child: new Container(
                            width: h*0.14,
                            height: h*0.14,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/camera_icon.jpg')
                                )
                            ))
                    ),
                  ),
                  Text('Camera')
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      getImage(1);
                    },
                    child: Container(
                        height: h*0.14,
                        width: h*0.14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(h*0.07),
                          color: Colors.grey,
                        ),
                        child: new Container(
                            width: h*0.14,
                            height: h*0.14,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/gallery_icon.jpg')
                                )
                            ))
                    ),
                  ),
                  Text('Gallery')
                ],
              ),
            ],
          ),
          behavior: HitTestBehavior.opaque,
        ),
      );
    });
  }

  Widget tile(BuildContext context, String str) {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: str, hintStyle: Theme
          .of(context)
          .textTheme
          .subtitle2),
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

