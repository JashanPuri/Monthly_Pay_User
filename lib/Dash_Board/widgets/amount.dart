import 'package:flutter/material.dart';

class Amount extends StatefulWidget {
  @override
  _AmountState createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Amount',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Collected',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      '805201',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(letterSpacing: 1.3),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text('Pending',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Text(
                      '211301',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(letterSpacing: 1.3),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
