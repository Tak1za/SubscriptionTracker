import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/models/subscription.dart';
import 'package:subscriber/widgets/add_subscription/payment_date.dart';
import 'package:subscriber/widgets/add_subscription/service_name.dart';
import 'package:subscriber/widgets/add_subscription/submit_button.dart';
import 'package:subscriber/widgets/add_subscription/subscription_cost.dart';
import 'package:subscriber/widgets/add_subscription/subscription_period_widget.dart';

class AddSubscriptionForm extends StatelessWidget {
  final focusSubscriptionCost = FocusNode();
  final DateTime _selectedDate = DateTime.now();
  final String _selectedSubscriptionPeriod = "Monthly";
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
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ServiceName(
                subscription: subscription,
                focusSubscriptionCost: focusSubscriptionCost,
              ),
              SizedBox(height: 20.0),
              SubscriptionCost(
                subscription: subscription,
                focusSubscriptionCost: focusSubscriptionCost,
              ),
              SizedBox(height: 30.0),
              PaymentDate(
                selectedDate: _selectedDate,
                subscription: subscription,
              ),
              SizedBox(height: 30.0),
              SubscriptionPeriodWidget(
                selectedSubscriptionPeriod: _selectedSubscriptionPeriod,
                subscription: subscription,
              ),
              SizedBox(height: 50.0),
              SubmitButton(
                formKey: _formKey,
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
