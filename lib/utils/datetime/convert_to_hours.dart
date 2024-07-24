import 'package:intl/intl.dart';

String convertToHours(String dateTime) {
  DateTime parsedDateTime = DateTime.parse(dateTime);

  DateTime now = DateTime.now();

  Duration difference = now.difference(parsedDateTime);

  int hoursAgo = difference.inHours;

  return '$hoursAgo';
}
