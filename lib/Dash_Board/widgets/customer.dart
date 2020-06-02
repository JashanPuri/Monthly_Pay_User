import 'package:flutter/material.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Customer',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:5.0),
                      child: Text(
                        'Active',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      '215',
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
                      padding: const EdgeInsets.symmetric(vertical:5.0),
                      child: Text('Inactive',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Text(
                      '20',
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