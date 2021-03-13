import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:subscriber/screens/add_subscription.dart';

class StartAdding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: AddSubscription(),
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Start by tapping here or swiping left",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
