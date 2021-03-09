import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionCost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Image.asset(
            "assets/images/rupee.png",
            color: Colors.white30,
          ),
          padding: EdgeInsets.all(0.0),
          constraints: BoxConstraints(),
          onPressed: () => null,
        ),
        SizedBox(width: 25.0),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50.0,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).selectedRowColor,
                    width: 2.0,
                  ),
                ),
                hintText: 'Enter cost',
                hintStyle: TextStyle(
                  color: Colors.white30,
                  fontSize: 20.0,
                ),
                contentPadding: EdgeInsets.only(left: 20.0),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
