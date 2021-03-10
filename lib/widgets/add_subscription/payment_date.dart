import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subscriber/models/subscription.dart';

class PaymentDate extends StatefulWidget {
  DateTime selectedDate;
  Subscription subscription;

  PaymentDate({
    Key key,
    @required this.selectedDate,
    this.subscription,
  }) : super(key: key);

  @override
  _PaymentDateState createState() => _PaymentDateState();
}

class _PaymentDateState extends State<PaymentDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.date_range,
              color: Colors.white30,
            ),
            padding: EdgeInsets.all(0.0),
            constraints: BoxConstraints(),
            onPressed: () => _selectDate(context),
          ),
          SizedBox(width: 25.0),
          Expanded(
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                height: 50.0,
                padding: EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: Text(
                  DateFormat.yMMMMd().format(widget.selectedDate),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != widget.selectedDate)
      setState(() {
        widget.selectedDate = picked;
        widget.subscription.paymentDate = widget.selectedDate;
      });
  }
}
