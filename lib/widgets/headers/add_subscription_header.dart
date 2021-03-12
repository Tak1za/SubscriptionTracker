import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddSubscriptionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Add Subscription',
        style: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
