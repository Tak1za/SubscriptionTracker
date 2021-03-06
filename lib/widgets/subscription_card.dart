import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  final String _subscription;

  SubscriptionCard(this._subscription);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            _subscription,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
