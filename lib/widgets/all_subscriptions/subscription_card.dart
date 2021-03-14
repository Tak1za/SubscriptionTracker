import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subscriber/models/subscription.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;

  SubscriptionCard({Key key, @required this.subscription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subscription.serviceName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹" + subscription.subscriptionCost.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Upcoming payment date: " +
                    calculateUpcomingPaymentDate(subscription),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String calculateUpcomingPaymentDate(Subscription subscription) {
    var nextPaymentDate = "";
    var paymentDate = DateTime.parse(subscription.paymentDate);
    var currentMonth = paymentDate.month;
    var currentYear = paymentDate.year;
    var currentDate = paymentDate.day;
    var month30 = [4, 6, 9, 11];

    switch (subscription.subscriptionPeriod) {
      case "Daily":
        nextPaymentDate = paymentDate.add(Duration(days: 1)).toString();
        break;
      case "Alternate":
        nextPaymentDate = paymentDate.add(Duration(days: 2)).toString();
        break;
      case "Weekly":
        nextPaymentDate = paymentDate.add(Duration(days: 7)).toString();
        break;
      case "Monthly":
        var daysToAdd = 0;
        var nextMonth =
            (currentMonth + 1) % 12 == 0 ? 12 : (currentMonth + 1) % 12;
        if (currentMonth == 2) {
          // subscription started in february, next month will always be march with 31 days
          if (currentYear % 4 == 0) {
            // if leap year
            daysToAdd = 29;
          } else {
            // if non leap year
            daysToAdd = 28;
          }
        } else if (month30.contains(nextMonth)) {
          if (currentDate == 31) {
            daysToAdd = 30;
          } else {
            daysToAdd = 31;
          }
        } else if (currentMonth == 1) {
          // if it's January, next month will be February
          if (currentDate == 31) {
            if (currentYear % 4 == 0) {
              // if leap year
              daysToAdd = 29;
            } else {
              // if non leap year
              daysToAdd = 28;
            }
          } else if (currentDate == 30){
            if (currentYear % 4 == 0) {
              // if leap year
              daysToAdd = 30;
            } else {
              // if non leap year
              daysToAdd = 29;
            }
          } else if (currentDate == 29) {
            if (currentYear % 4 == 0) {
              // if leap year
              daysToAdd = 31;
            } else {
              // if non leap year
              daysToAdd = 30;
            }
          } else {
            daysToAdd = 31;
          }
        } else {
          daysToAdd = 30;
        }

        nextPaymentDate = paymentDate.add(Duration(days: daysToAdd)).toString();
        break;
      case "Annually":
        if (currentMonth == 2) {
          // if its February
          if (currentYear % 4 == 0) {
            // if a leap year
            if (currentDate == 29) {
              // if currentDate is 29th, next payment date will be 28th of february
              nextPaymentDate = DateTime.utc(currentYear + 1, currentMonth, 28)
                  .toLocal()
                  .toString();
              break;
            } else {
              // if currentDate is not 29th, next payment date will be current date of next year
              nextPaymentDate =
                  DateTime.utc(currentYear + 1, currentMonth, currentDate)
                      .toLocal()
                      .toString();
              break;
            }
          }
        }
        nextPaymentDate =
            DateTime.utc(currentYear + 1, currentMonth, currentDate)
                .toLocal()
                .toString();
        break;
    }
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(nextPaymentDate));
  }
}
