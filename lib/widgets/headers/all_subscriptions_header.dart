import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllSubscriptionsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
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
