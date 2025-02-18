import 'package:intl/intl.dart';

// Helper function to parse the time string
DateTime parseTimeString(String timeString) {
  DateFormat format = DateFormat('hh:mm a');
  return format.parse(timeString);
}

String getTimeDifference(String timeString) {
  // Get the current time
  DateTime now = DateTime.now();

  // Parse the event time string into a DateTime object
  DateTime eventTime = parseTimeString(timeString);

  // Adjust the event time to today's date
  eventTime =
      DateTime(now.year, now.month, now.day, eventTime.hour, eventTime.minute);

  // Check if the event time has passed
  if (now.isAfter(eventTime)) {
    Duration difference = now.difference(eventTime);

    // If the event passed 12 hours or more ago, calculate the next day's event
    if (difference.inHours >= 12) {
      DateTime nextEventTime = eventTime.add(Duration(days: 1));
      Duration timeLeft = nextEventTime.difference(now);

      if (timeLeft.inHours > 0) {
        return 'in ${timeLeft.inHours}h';
      } else {
        return 'in ${timeLeft.inMinutes}m';
      }
    } else {
      // Event passed within the last 12 hours
      if (difference.inHours > 0) {
        return '${difference.inHours}h ago';
      } else {
        return '${difference.inMinutes}m ago';
      }
    }
  } else {
    // Event is in the future
    Duration timeLeft = eventTime.difference(now);

    if (timeLeft.inHours > 0) {
      return 'in ${timeLeft.inHours}h';
    } else {
      return 'in ${timeLeft.inMinutes}m';
    }
  }
}
