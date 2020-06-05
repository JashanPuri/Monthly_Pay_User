import 'package:flutter/material.dart';

import '../models/ledger_model.dart';

class BounceLedger extends StatefulWidget {
  @override
  _BounceLedgerState createState() => _BounceLedgerState();
}

class _BounceLedgerState extends State<BounceLedger> {
  List<BounceLedgerModel> bounceCustomers = [
    BounceLedgerModel(
      'Customer 1',
      'Invoice 1',
      100,
    ),
    BounceLedgerModel(
      'Customer 1',
      'Invoice 1',
      100,
    ),
    BounceLedgerModel(
      'Customer 1',
      'Invoice 1',
      100,
    ),
    BounceLedgerModel(
      'Customer 1',
      'Invoice 1',
      100,
    )
  ];

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                height: constraints.maxHeight * 0.2,
                child: Text(
                  'Bounce',
                  style: _theme.textTheme.headline6,
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.72,
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text(
                          'Customer',
                          style: _theme.textTheme.subtitle1,
                        )),
                        DataColumn(
                          label: Text('Invoice',
                              style: _theme.textTheme.subtitle1),
                        ),
                        DataColumn(
                          label:
                              Text('Amount', style: _theme.textTheme.subtitle1),
                        ),
                      ],
                      rows: bounceCustomers.map((customer) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(
                                customer.name,
                                style: _theme.textTheme.subtitle2,
                              ),
                            ),
                            DataCell(
                              Text(
                                customer.invoice,
                                style: _theme.textTheme.subtitle2,
                              ),
                            ),
                            DataCell(
                              Text(
                                customer.amount.toString(),
                                style: _theme.textTheme.subtitle2,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
