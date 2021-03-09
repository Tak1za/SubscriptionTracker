import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton.icon(
        onPressed: () => print('pressed'),
        icon: Icon(Icons.check),
        label: Text('Submit'),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
