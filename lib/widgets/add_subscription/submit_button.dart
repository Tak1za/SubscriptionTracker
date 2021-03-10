import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/models/subscription.dart';

class SubmitButton extends StatelessWidget {
  GlobalKey<FormState> formKey;
  Subscription subscription;
  DateTime selectedDate;
  String selectedSubscriptionPeriod;

  SubmitButton(
      {Key key,
      @required this.formKey,
      this.selectedDate,
      this.selectedSubscriptionPeriod,
      this.subscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton.icon(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print("Service Name: " + subscription.serviceName);
            print("Subscription Cost: " +
                subscription.subscriptionCost.toString());
            print("Subscription Payment Date: " +
                subscription.paymentDate.toString());
            print("Subscription Period: " + subscription.subscriptionPeriod);
          }
        },
        icon: Icon(Icons.check),
        label: Text('Submit'),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
