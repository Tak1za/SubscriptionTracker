import 'dart:ui';

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscriber/helper/helper.dart';
import 'package:subscriber/models/subscription.dart';

class AllSubscriptionsListItem extends StatefulWidget {
  final Subscription subscription;

  AllSubscriptionsListItem({Key key, @required this.subscription})
      : super(key: key);

  @override
  _AllSubscriptionsListItemState createState() =>
      _AllSubscriptionsListItemState();
}

class _AllSubscriptionsListItemState extends State<AllSubscriptionsListItem> {
  DeviceCalendarPlugin _deviceCalendarPlugin;
  Subscription _subscription;

  @override
  void initState() {
    _subscription = widget.subscription;
    _deviceCalendarPlugin = DeviceCalendarPlugin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showSetReminderAlert(context);
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 150.0,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(
                _subscription.imagePath,
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
                          _subscription.serviceName,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹" + _subscription.subscriptionCost.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Next payment date: " + _subscription.nextPaymentDate,
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
      ),
    );
  }

  showSetReminderAlert(BuildContext context) async {
    Widget noButton = TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text('No'),
    );

    var calendars = await getCalendars(_deviceCalendarPlugin);

    Widget yesButton = TextButton(
      onPressed: () async {
        ScaffoldMessengerState scaffoldMessenger =
            ScaffoldMessenger.of(context);
        var result = await addEventToCalendar(
            calendars.first, _subscription, _deviceCalendarPlugin);
        Navigator.pop(context);
        ScaffoldFeatureController controller;
        if (result.isSuccess) {
          controller = scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Added')),
          );
        } else {
          controller = scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Failed')),
          );
        }
        await controller.closed;
      },
      child: Text('Yes'),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Add Reminder"),
      content: Text("Set " +
          _subscription.subscriptionPeriod.toLowerCase() +
          " reminder for " +
          _subscription.nextPaymentDate +
          "?"),
      actions: [
        yesButton,
        noButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
