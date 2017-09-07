import 'package:flutter/material.dart';
import 'life_entry_activity.dart';

class LifeEntry {
  LifeEntry({this.startTime, this.endTime, this.life_entry_activities});

  TimeOfDay startTime;
  TimeOfDay endTime;
  List<LifeEntryActivity> life_entry_activities;
}