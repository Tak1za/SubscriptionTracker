import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/models/subscription.dart';
import 'file:///D:/Development/AndroidStudioProjects/subscriber/lib/widgets/headers/add_subscription_header.dart';
import 'package:subscriber/widgets/forms/add_subscription_form.dart';

class AddSubscription extends StatefulWidget {
  List<Subscription> subscriptions;

  AddSubscription({this.subscriptions});

  @override
  _AddSubscriptionState createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
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
      body: Column(
        children: <Widget>[
          AddSubscriptionHeader(),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                      child: AddSubscriptionForm()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
