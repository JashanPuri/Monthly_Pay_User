import 'package:flutter/material.dart';
import '../models/invoice_customers.dart';

class CustomerCard extends StatefulWidget {
  final List<InvoiceCustomer> customers;

  CustomerCard({@required this.customers});

  @override
  _CustomerCardState createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  InvoiceCustomer currentCustomer;
  String currentlySelectedName;
  @override
  void initState() {
    currentCustomer = widget.customers[0];
    currentlySelectedName = currentCustomer.name;
    super.initState();
  }

  GlobalKey _dropDownItem = GlobalKey();

  List<DropdownMenuItem> get _createrDropDownList {
    return List.generate(
      widget.customers.length,
      (index) {
        return DropdownMenuItem(
          value: widget.customers[index],
          child: Text(
            widget.customers[index].name,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Drop Down Widget
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Customer',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
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
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 25, color: Theme.of(context).accentColor),
                      isExpanded: true,
                      key: _dropDownItem,
                      value: currentCustomer,
                      items: _createrDropDownList,
                      onChanged: (val) {
                        setState(() {
                          currentCustomer = val;
                        });
                      },
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 8),
                  child: Text(
                    'Limit',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                  width: constraints.maxWidth * 0.5,
                  height: 56,
                  child: Card(
                    color: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 30,
                      ),
                      child: TextField(
                        onSubmitted: (val) {
                          setState(() {
                            currentCustomer.limit = double.parse(val);
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration.collapsed(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: currentCustomer.limit.toString(),
                          hintStyle: theme.textTheme.subtitle1
                              .copyWith(color: theme.accentColor, fontSize: 25),
                        ),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1
                            .copyWith(color: theme.accentColor, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 8),
                  child: Text(
                    'Amount',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                  width: constraints.maxWidth * 0.5,
                  height: 56,
                  child: Card(
                    color: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 30,
                      ),
                      child: TextField(
                        onSubmitted: (val) {
                          setState(() {
                            currentCustomer.limit = double.parse(val);
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration.collapsed(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: currentCustomer.amount.toString(),
                          hintStyle: theme.textTheme.subtitle1
                              .copyWith(color: theme.accentColor, fontSize: 25),
                        ),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1
                            .copyWith(color: theme.accentColor, fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
