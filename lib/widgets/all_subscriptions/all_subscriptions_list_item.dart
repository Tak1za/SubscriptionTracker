import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/models/subscription.dart';

class AllSubscriptionsListItem extends StatelessWidget {
  final Subscription subscription;

  AllSubscriptionsListItem({Key key, @required this.subscription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage(
              subscription.imagePath,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subscription.serviceName,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "₹" + subscription.subscriptionCost.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Next payment date: " + subscription.nextPaymentDate,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
