import 'package:flutter/cupertino.dart';
import 'package:subscriber/models/subscription.dart';
import 'package:subscriber/widgets/add_subscription/payment_date.dart';
import 'package:subscriber/widgets/add_subscription/service_name.dart';
import 'package:subscriber/widgets/add_subscription/submit_button.dart';
import 'package:subscriber/widgets/add_subscription/subscription_cost.dart';
import 'package:subscriber/widgets/add_subscription/subscription_period_widget.dart';

class AddSubscriptionForm extends StatefulWidget {
  @override
  _AddSubscriptionFormState createState() => _AddSubscriptionFormState();
}

class _AddSubscriptionFormState extends State<AddSubscriptionForm> {
  final focusSubscriptionCost = FocusNode();
  DateTime _selectedDate = DateTime.now();
  String _selectedSubscriptionPeriod = "Monthly";

  final _formKey = GlobalKey<FormState>();
  Subscription subscription = Subscription();

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
