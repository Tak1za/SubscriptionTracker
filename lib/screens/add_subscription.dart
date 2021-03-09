import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Development/AndroidStudioProjects/subscriber/lib/widgets/add_subscription/add_subscription_header.dart';
import 'file:///D:/Development/AndroidStudioProjects/subscriber/lib/widgets/add_subscription/service_name.dart';
import 'file:///D:/Development/AndroidStudioProjects/subscriber/lib/widgets/add_subscription/subscription_cost.dart';
import 'file:///D:/Development/AndroidStudioProjects/subscriber/lib/widgets/add_subscription/subscription_period.dart';
import 'package:subscriber/widgets/add_subscription/payment_date.dart';
import 'package:subscriber/widgets/add_subscription/submit_button.dart';

class AddSubscription extends StatefulWidget {
  @override
  _AddSubscriptionState createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  DateTime _selectedDate = DateTime.now();
  String _selectedSubscriptionPeriod = "Monthly";
  List<String> _subscriptionPeriods = <String>[
    "Daily",
    "Alternate Day",
    "Weekly",
    "Monthly",
    "Half Yearly",
    "Annually",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AddSubscriptionHeader(),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    ServiceName(),
                    SizedBox(height: 20.0),
                    SubscriptionCost(),
                    SizedBox(height: 30.0),
                    PaymentDate(
                      _selectedDate,
                    ),
                    SizedBox(height: 30.0),
                    SubscriptionPeriod(
                      _selectedSubscriptionPeriod,
                      _subscriptionPeriods,
                    ),
                    SizedBox(height: 50.0),
                    SubmitButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
