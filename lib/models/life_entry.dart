import 'package:flutter/material.dart';
import 'package:life_history_mobile/models/life_entry_base.dart';
import 'package:life_history_mobile/utils/time_of_day_converter.dart';

class LifeEntry extends LifeEntryBase {
  LifeEntry(LifeEntryBase lifeEntry)
      : super(
            id: lifeEntry.id,
            dayId: lifeEntry.dayId,
            lifeEntryActivities: lifeEntry.lifeEntryActivities,
            startTimeString: lifeEntry.startTimeString,
            endTimeString: lifeEntry.endTimeString);

  TimeOfDay get startTime {
    return convertStringToTimeOfDay(startTimeString);
  }

  TimeOfDay get endTime {
    return convertStringToTimeOfDay(endTimeString);
  }

  set startTime(TimeOfDay value) {
    startTimeString = convertTimeOfDayToString(value);
  }

  set endTime(TimeOfDay value) {
    endTimeString = convertTimeOfDayToString(value);
  }

  factory LifeEntry.fromJson(Map<String, dynamic> json) {
    final lifeEntry = new LifeEntryBase.fromJson(json);
    return new LifeEntry(lifeEntry);
  }
}
