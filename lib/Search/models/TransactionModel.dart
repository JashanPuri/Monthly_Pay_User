import 'package:flutter/material.dart';

enum Status{
  active,
  inActive,
  holdForMonth,
}

class CustomerTransaction {
  String name;
  String phoneNumber;
  String id;
  String bank;
  double limit;
  Image image;
  Status status;

  CustomerTransaction({this.bank,this.id,this.limit,this.name,this.phoneNumber,this.status,this.image});
  
}