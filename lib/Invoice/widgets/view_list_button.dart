import 'package:flutter/material.dart';
import 'package:monthly_pay_user/Invoice/models/invoice_customers.dart';
import '../../View_List/view_list.dart';

class ViewListButton extends StatefulWidget {
  final List<InvoiceCustomer> invoiceCustomers;

  ViewListButton({this.invoiceCustomers});
  @override
  _ViewListButtonState createState() => _ViewListButtonState();
}

class _ViewListButtonState extends State<ViewListButton> {
  void _fadeTransitionWithPush(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(
          milliseconds: 600,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return FlatButton.icon(
      icon: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(
          Icons.view_list,
          size: 30,
        ),
      ),
      label: Expanded(
        child: Text(
          'View List',
          textAlign: TextAlign.center,
          style: _theme.textTheme.subtitle1
              .copyWith(color: _theme.accentColor, fontSize: 28),
        ),
      ),
      onPressed: () => _fadeTransitionWithPush(
        context,
        ViewList(
          invoiceCustomers: widget.invoiceCustomers,
        ),
      ),
      color: _theme.primaryColor,
      textColor: _theme.accentColor,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
