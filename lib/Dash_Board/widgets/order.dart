import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Order',
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
                        'Approve',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
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
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:5.0),
                      child: Text('Waiting',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Text(
                      '12',
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