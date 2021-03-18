import 'dart:ui';

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  _AllSubscriptionsListItemState() {
    _deviceCalendarPlugin = DeviceCalendarPlugin();
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
                widget.subscription.imagePath,
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
                          widget.subscription.serviceName,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹" + widget.subscription.subscriptionCost.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Next payment date: " +
                          widget.subscription.nextPaymentDate,
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

    var calendars = await getCalendars();

    Widget yesButton = TextButton(
      onPressed: () async {
        ScaffoldMessengerState scaffoldMessenger =
            ScaffoldMessenger.of(context);
        var result = await addEventToCalendar(calendars.first);
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
          widget.subscription.subscriptionPeriod.toLowerCase() +
          " reminder for " +
          widget.subscription.nextPaymentDate +
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

  Future<List<Calendar>> getCalendars() async {
    var _calendars;
    try {
      var arePermissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (arePermissionsGranted.isSuccess && !arePermissionsGranted.data) {
        arePermissionsGranted =
            await _deviceCalendarPlugin.requestPermissions();
        if (!arePermissionsGranted.isSuccess || !arePermissionsGranted.data) {
          return List.empty();
        }
      }
      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      _calendars = calendarsResult?.data;
      if (_calendars.isEmpty || calendarsResult.errorMessages.length > 0) {
        return List.empty();
      }
      var result =
          _calendars?.where((c) => !c.isReadOnly)?.toList() ?? <Calendar>[];
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Result<String>> addEventToCalendar(Calendar calendar) async {
    var recurrenceFrequency = getRecurrenceFrequency();
    var startDate = new DateFormat.yMMMMd('en_US')
        .parse(widget.subscription.nextPaymentDate);
    var endDate = new DateFormat.yMMMMd('en_US')
        .parse(widget.subscription.nextPaymentDate)
        .add(Duration(days: 1));
    var event = new Event(
      calendar.id,
      title: widget.subscription.serviceName,
      start: startDate,
      end: endDate,
      recurrenceRule: RecurrenceRule(recurrenceFrequency),
      allDay: true,
    );
    var result = await _deviceCalendarPlugin.createOrUpdateEvent(event);
    return result;
  }

  getRecurrenceFrequency() {
    switch (widget.subscription.subscriptionPeriod) {
      case "Daily":
        return RecurrenceFrequency.Daily;
      case "Weekly":
        return RecurrenceFrequency.Weekly;
      case "Monthly":
        return RecurrenceFrequency.Monthly;
      case "Yearly":
        return RecurrenceFrequency.Yearly;
    }
  }
}
