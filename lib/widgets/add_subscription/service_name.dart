import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceName extends StatelessWidget {
  const ServiceName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              borderSide: BorderSide(
                color: Colors.white30,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(
                  color: Colors.black87, width: 2.0)),
          hintText: 'Enter service name',
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
    );
  }
}
