import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  static List<String> customerNames = [
    'Shivani Jaiswal',
    'Rajesh Jaiswal',
    'Ravi Dubey',
    'Vidhu Dubey',
    'Vivek Jaiswal'
  ];

  String _currentlySelected = customerNames[0];

  List<DropdownMenuItem> get _createrDropDownList {
    return List.generate(
      customerNames.length,
      (index) {
        return DropdownMenuItem(
          value: customerNames[index],
          child: Text(
            customerNames[index],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: Theme.of(context).primaryColor,
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_drop_down,
              size: 40,
              color: Theme.of(context).accentColor,
            ),
          ),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: 25, color: Theme.of(context).accentColor),
          isExpanded: true,
          value: _currentlySelected,
          items: _createrDropDownList,
          onChanged: (val) {
            setState(() {
              _currentlySelected = val;
            });
          },
        ),
      ),
    );
  }
}
