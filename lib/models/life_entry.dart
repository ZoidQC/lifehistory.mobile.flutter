import 'package:flutter/material.dart';
import 'life_entry_activity.dart';

class LifeEntry {
  LifeEntry({this.startTime, this.endTime, this.lifeEntryActivities});

  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<LifeEntryActivity> lifeEntryActivities;
}
