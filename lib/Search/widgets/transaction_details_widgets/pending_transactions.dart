import 'package:flutter/material.dart';

class PendingTransaction extends StatefulWidget {
  @override
  _PendingTransactionState createState() => _PendingTransactionState();
}

class _PendingTransactionState extends State<PendingTransaction> {
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: constraints.maxHeight * 0.2,
              child: Text(
                'Pending',
                style: _theme.textTheme.headline6,
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.74,
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(columns: [
                    DataColumn(
                      label: Text('Date', style: _theme.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text('Invoice', style: _theme.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text('Amount', style: _theme.textTheme.subtitle1),
                    )
                    
                    
                  ], rows: []),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}