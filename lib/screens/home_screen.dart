import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscriber/screens/add_subscription.dart';
import 'package:subscriber/widgets/headers/all_subscriptions_header.dart';
import 'package:subscriber/widgets/subscription_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _subscriptions = [
    "Google One",
    "Spotify",
    "Xbox",
    "Netflix",
    "Amazon Prime",
    "Hotstar",
    "Sony Liv"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close_rounded),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            SystemNavigator.pop(animated: true);
          },
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 35.0,
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddSubscription()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          AllSubscriptionsHeader(),
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _subscriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return SubscriptionCard(_subscriptions[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
