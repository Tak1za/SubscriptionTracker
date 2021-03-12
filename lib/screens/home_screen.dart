import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:subscriber/screens/add_subscription.dart';
import 'package:subscriber/widgets/all_subscriptions/all_subscriptions_list.dart';
import 'package:subscriber/widgets/headers/all_subscriptions_header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String swipeDirection;

    return GestureDetector(
      onPanUpdate: (details) {
        swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
      },
      onPanEnd: (details) {
        if (swipeDirection == 'left') {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: AddSubscription(),
            ),
          );
        }
      },
      child: Scaffold(
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
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: AddSubscription(),
                  ),
                );
              },
            )
          ],
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AllSubscriptionsHeader(),
                AllSubscriptionList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
