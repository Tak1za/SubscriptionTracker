import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/widgets/forms/add_subscription_form.dart';

import '../widgets/headers/add_subscription_header.dart';

class AddSubscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String swipeDirection;

    return GestureDetector(
      onPanUpdate: (details) {
        swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
      },
      onPanEnd: (details) {
        if (swipeDirection == 'right') {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
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
            children: <Widget>[
              AddSubscriptionHeader(),
              AddSubscriptionForm(),
            ],
          ),
        ),
      ),
    );
  }
}
