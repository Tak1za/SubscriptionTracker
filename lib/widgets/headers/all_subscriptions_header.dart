import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllSubscriptionsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
      child: Text(
        'Your Subscriptions',
        style: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
