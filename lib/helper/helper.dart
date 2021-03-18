import 'package:device_calendar/device_calendar.dart';
import 'package:intl/intl.dart';
import 'package:subscriber/models/subscription.dart';

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
        } else if (currentDate == 30) {
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
    case "Yearly":
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
      nextPaymentDate = DateTime.utc(currentYear + 1, currentMonth, currentDate)
          .toLocal()
          .toString();
      break;
  }
  return DateFormat.yMMMMd().format(DateTime.parse(nextPaymentDate));
}

String getSelectedServiceImagePath(
    Subscription subscription, dynamic services) {
  var currentService = services
      .firstWhere((element) => element.name == subscription.serviceName);
  return currentService.imagePath;
}

Future<List<Calendar>> getCalendars(
    DeviceCalendarPlugin deviceCalendarPlugin) async {
  var _calendars;
  try {
    var arePermissionsGranted = await deviceCalendarPlugin.hasPermissions();
    if (arePermissionsGranted.isSuccess && !arePermissionsGranted.data) {
      arePermissionsGranted = await deviceCalendarPlugin.requestPermissions();
      if (!arePermissionsGranted.isSuccess || !arePermissionsGranted.data) {
        return List.empty();
      }
    }
    final calendarsResult = await deviceCalendarPlugin.retrieveCalendars();
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

Future<Result<String>> addEventToCalendar(
    Calendar calendar,
    Subscription subscription,
    DeviceCalendarPlugin deviceCalendarPlugin) async {
  var recurrenceFrequency = getRecurrenceFrequency(subscription);
  var startDate =
      new DateFormat.yMMMMd('en_US').parse(subscription.nextPaymentDate);
  var endDate = new DateFormat.yMMMMd('en_US')
      .parse(subscription.nextPaymentDate)
      .add(Duration(days: 1));
  var event = new Event(
    calendar.id,
    title: subscription.serviceName + " Subscription",
    start: startDate,
    end: endDate,
    recurrenceRule: RecurrenceRule(recurrenceFrequency),
    allDay: true,
  );
  event.reminders = getReminderList(subscription);
  var result = await deviceCalendarPlugin.createOrUpdateEvent(event);
  return result;
}

getRecurrenceFrequency(Subscription subscription) {
  switch (subscription.subscriptionPeriod) {
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

List<Reminder> getReminderList(Subscription subscription) {
  return [Reminder(minutes: 60)];
}
