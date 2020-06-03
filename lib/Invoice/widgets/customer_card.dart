import 'package:flutter/material.dart';

import 'drop_down.dart';

class CustomerCard extends StatelessWidget {
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
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Customer',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                DropDownWidget(),
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
                   margin: EdgeInsets.only(left: 30,right: 30),
                  child: Card(
                    color: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Text(
                        '350',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1
                            .copyWith(color: theme.accentColor),
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
                  margin: EdgeInsets.only(bottom: 30,left: 30,right: 30),
                  child: Card(
                    color: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30,),
                      child: Text(
                        '350',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1
                            .copyWith(color: theme.accentColor),
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
