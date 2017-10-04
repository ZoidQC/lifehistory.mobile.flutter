import 'package:flutter/material.dart';
import 'package:life_history_mobile/utils/time_of_day_converter.dart';
import 'package:test/test.dart';

main() {
  test('convertStringToTimeOfDay works', () {
    final value = "17:10:00";
    final result = convertStringToTimeOfDay(value);

    expect(result.hour, 17);
    expect(result.minute, 10);
  });

  test('convertTimeOfDayToString works', () {
    final value = new TimeOfDay(hour: 14, minute: 34);
    final result = convertTimeOfDayToString(value);

    expect(result, "14:34:00");
  });
}
