import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return FlatButton.icon(
      icon: Padding(
        padding: EdgeInsets.only(right:10),
              child: Icon(
          Icons.save_alt,
          size: 30,
        ),
      ),
      label: Expanded(
              child: Text(
          'Save Invoice',
          textAlign: TextAlign.center,
          style: _theme.textTheme.subtitle1
              .copyWith(color: _theme.accentColor, fontSize: 28),
        ),
      ),
      onPressed: () {},
      color: _theme.primaryColor,
      textColor: _theme.accentColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
