// ignore: avoid_web_libraries_in_flutter
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monthly_pay_user/Add_Customer/order_detail.dart';

class Add_Photo extends StatefulWidget {
  @override
  _Add_PhotoState createState() => _Add_PhotoState();
}

class _Add_PhotoState extends State<Add_Photo> {
  String name;
  File _image;

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
    final appbar = AppBar(
      title: Text('Add Photo'),
      elevation: 0,
    );
    final h=MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-appbar.preferredSize.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //color: Theme.of(context).primaryColor,
            width: w,
            height: h*0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
              color: Theme.of(context).primaryColor
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                  height: h*0.22,
                  width: h*0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h*0.12),
                      color: Colors.grey,
                    ),
                    child: new Container(
                        width: h*0.24,
                        height: h*0.24,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: _image!=null ? FileImage(_image)
                                    : AssetImage('assets/images/account_img.jpg')
                            )
                        ))
              ),
                ),
            ]
            ),
          ),
          Row(
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
          Container(
            height: h*0.06,
            color: Colors.grey[100],
            child: GestureDetector(
              onTap: () {
                _Fade(context, orderDetail());
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
