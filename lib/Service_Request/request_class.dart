import 'package:flutter/material.dart';

class request_class{
  String name;
  int mobile;
  String description;
  DateTime date;
  double amount;

  request_class({
    @required this.name,
    @required this.mobile,
    @required this.date,
    @required this.amount,
    @required description
  });
}