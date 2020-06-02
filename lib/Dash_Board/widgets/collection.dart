import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Collection',
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
                        'Paid',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      '210',
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
                      child: Text('Unpaid',
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