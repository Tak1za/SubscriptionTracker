import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/models/subscription.dart';

class ServiceName extends StatelessWidget {
  final Subscription subscription;
  final FocusNode focusSubscriptionCost;

  ServiceName(
      {Key key, @required this.subscription, this.focusSubscriptionCost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: TextFormField(
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'This is not a valid value';
          }
        },
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(focusSubscriptionCost);
        },
        onSaved: (String value) {
          subscription.serviceName = value;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            borderSide: BorderSide(
              color: Theme.of(context).selectedRowColor,
              width: 2.0,
            ),
          ),
          hintText: 'Enter service name',
          hintStyle: TextStyle(
            color: Colors.white30,
            fontSize: 20.0,
          ),
          contentPadding: EdgeInsets.only(left: 20.0),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
