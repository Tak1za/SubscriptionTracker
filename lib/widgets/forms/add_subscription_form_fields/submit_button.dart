import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriber/models/subscription.dart';
import 'package:subscriber/state/service_manager.dart';
import 'package:subscriber/state/subscription_manager.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String selectedService;
  final Subscription subscription;
  final DateTime selectedDate;
  final String selectedSubscriptionPeriod;

  SubmitButton({
    Key key,
    @required this.formKey,
    this.selectedService,
    this.selectedDate,
    this.selectedSubscriptionPeriod,
    this.subscription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subscriptionManager = Provider.of<SubscriptionManager>(context, listen: false);
    var serviceManager = Provider.of<ServiceManager>(context, listen: false);
    return Container(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton.icon(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            subscriptionManager.addSubscription(subscription);
            serviceManager.markPicked(subscription.serviceName);
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
