import 'package:flutter/material.dart';

TimeOfDay convertStringToTimeOfDay(String value) {
  if (value == null)
    return null;

  final List<String> parts = value.split(':');

  if (parts.length != 3) {
    return null;
  }

  var hour;
  var minute;

  try {
    hour = int.parse(parts[0]);
    minute = int.parse(parts[1]);
  } on FormatException {
    return null;
  }

  return new TimeOfDay(hour: hour, minute: minute);
}

String convertTimeOfDayToString(TimeOfDay value) {
  if (value == null)
    return null;

  return "${value.hour}:${value.minute}:00";
}
