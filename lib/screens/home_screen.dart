import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        centerTitle: true,
        title: Text(
          'Subscriptions',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () => print("add button tapped"))
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Expanded(
            child: Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _subscriptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SubscriptionCard(_subscriptions[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
