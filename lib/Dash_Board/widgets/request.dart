import 'package:flutter/material.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Request',
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
                        'Solved',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Text(
                      '10',
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
                      child: Text('Unsolved',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Text(
                      '5',
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