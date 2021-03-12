import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriber/models/subscription.dart';
import 'package:subscriber/state/state_manager.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Subscription subscription;
  final DateTime selectedDate;
  final String selectedSubscriptionPeriod;

  SubmitButton({
    Key key,
    @required this.formKey,
    this.selectedDate,
    this.selectedSubscriptionPeriod,
    this.subscription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateManager = Provider.of<StateManager>(context, listen: false);
    return Container(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton.icon(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            stateManager.addSubscription(subscription);
            Navigator.pop(context);
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
