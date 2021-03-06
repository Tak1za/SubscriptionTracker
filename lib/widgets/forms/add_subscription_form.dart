import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/models/subscription.dart';

import 'add_subscription_form_fields/payment_date.dart';
import 'add_subscription_form_fields/service_name.dart';
import 'add_subscription_form_fields/submit_button.dart';
import 'add_subscription_form_fields/subscription_cost.dart';
import 'add_subscription_form_fields/subscription_period.dart';

class AddSubscriptionForm extends StatelessWidget {
  final DateTime _selectedDate = DateTime.now();
  final String _selectedSubscriptionPeriod = "Monthly";
  final String _selectedService = "Pick a service...";
  final _formKey = GlobalKey<FormState>();
  final Subscription subscription = Subscription();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ServiceName(
                subscription: subscription,
                serviceName: _selectedService
              ),
              SizedBox(height: 20.0),
              SubscriptionCost(
                subscription: subscription,
              ),
              SizedBox(height: 30.0),
              PaymentDate(
                selectedDate: _selectedDate,
                subscription: subscription,
              ),
              SizedBox(height: 30.0),
              SubscriptionPeriod(
                selectedSubscriptionPeriod: _selectedSubscriptionPeriod,
                subscription: subscription,
              ),
              SizedBox(height: 30.0),
              SubmitButton(
                formKey: _formKey,
                selectedService: _selectedService,
                selectedDate: _selectedDate,
                selectedSubscriptionPeriod: _selectedSubscriptionPeriod,
                subscription: subscription,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
