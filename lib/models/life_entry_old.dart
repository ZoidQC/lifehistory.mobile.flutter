import 'package:flutter/material.dart';
import 'life_entry_activity_old.dart';

class LifeEntryOld {
  LifeEntryOld({this.startTime, this.endTime, this.lifeEntryActivities});

  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<LifeEntryActivityOld> lifeEntryActivities;
}