import 'package:flutter/material.dart';
import '../../Invoice/models/invoice_customers.dart';

class InvoiceListTile extends StatefulWidget {
  final List<InvoiceCustomer> invoiceCustomers;

  InvoiceListTile({@required this.invoiceCustomers});

  @override
  _InvoiceListTileState createState() => _InvoiceListTileState();
}

class _InvoiceListTileState extends State<InvoiceListTile> {
  @override
  Widget build(BuildContext context) {
    var _invoiceCustomers = widget.invoiceCustomers;
    var _theme = Theme.of(context);
    return ListView.builder(
      itemCount: _invoiceCustomers.length,
      itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                    child: Text(
                      '${_invoiceCustomers[index].name}',
                      style: _theme.textTheme.subtitle1.copyWith(fontSize: 23),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                    child: Text(
                      "${_invoiceCustomers[index].amount}",
                      style: _theme.textTheme.subtitle2.copyWith(fontSize: 20),
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.mode_edit,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            );
          },
        );
  }
}
