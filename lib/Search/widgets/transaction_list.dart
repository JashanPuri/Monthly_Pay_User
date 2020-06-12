import 'package:flutter/material.dart';
import '../models/TransactionModel.dart';
import 'transaction_customer_details.dart';

class TransactionList extends StatefulWidget {
  final List<CustomerTransaction> transactionList;
  TransactionList({this.transactionList});

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
    return ListView.builder(
      itemBuilder: (context, index) {
        Image _customerImage = widget.transactionList[index].image == null
            ? Image.asset(
                'assets/images/account_img.jpg',
                fit: BoxFit.fill,
              )
            : widget.transactionList[index].image;
        Status _currentStatus = widget.transactionList[index].status;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransactionCustomerDetails(
                  customer: widget.transactionList[index],
                  customerImage: _customerImage,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Hero(
                  tag: widget.transactionList[index].id,
                  child: CircleAvatar(
                    maxRadius: 30,
                    child: _customerImage,
                  ),
                ),
                title: Text(
                  widget.transactionList[index].name,
                  style: _theme.textTheme.subtitle1.copyWith(fontSize: 25),
                ),
                subtitle: Text(
                  widget.transactionList[index].phoneNumber,
                  style: _theme.textTheme.subtitle2.copyWith(fontSize: 20),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: _theme.primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Active',
                            overflow: TextOverflow.ellipsis,
                            style: _theme.textTheme.subtitle1,
                          ),
                          value: Status.active,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Inactive',
                            overflow: TextOverflow.ellipsis,
                            style: _theme.textTheme.subtitle1,
                          ),
                          value: Status.inActive,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Hold For Month',
                            overflow: TextOverflow.ellipsis,
                            style: _theme.textTheme.subtitle1,
                          ),
                          value: Status.holdForMonth,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          widget.transactionList[index].status = value;
                          _currentStatus = value;
                        });
                      },
                      value: _currentStatus,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: widget.transactionList.length,
    );
  }
}
