import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_history_mobile/models/life_entry.dart';

main() {
  test('JSON deserialization works for LifeEntry', () {
    var json = """
  {
  "day_id": 2475, 
  "end_time": null, 
  "id": 23810, 
  "life_entry_activities": [
    {
      "activity": {
        "activity_type": {
          "id": 1, 
          "name": "Nourriture", 
          "show_quantity": true, 
          "show_rating": true
        }, 
        "id": 1446, 
        "name": "Boeuf \u00e0 l'orange"
      }, 
      "description": null, 
      "id": 25435, 
      "life_entry_id": 23810, 
      "quantity": 1.0, 
      "rating": 6
    }, 
    {
      "activity": {
        "activity_type": {
          "id": 1, 
          "name": "Nourriture", 
          "show_quantity": true, 
          "show_rating": true
        }, 
        "id": 1384, 
        "name": "Riz"
      }, 
      "description": null, 
      "id": 25436, 
      "life_entry_id": 23810, 
      "quantity": 2.0, 
      "rating": 7
    }, 
    {
      "activity": {
        "activity_type": {
          "id": 1, 
          "name": "Nourriture", 
          "show_quantity": true, 
          "show_rating": true
        }, 
        "id": 342, 
        "name": "Chausson Pillsbury"
      }, 
      "description": "", 
      "id": 25437, 
      "life_entry_id": 23810, 
      "quantity": 5.0, 
      "rating": 10
    }
  ], 
  "start_time": "17:10:00"
}
    """;
    var jsonMap = JSON.decode(json);
    var model = new LifeEntry.fromJson(jsonMap);

    expect(model.id, 23810);
    expect(model.startTime, new TimeOfDay(hour: 17, minute: 10));
    expect(model.lifeEntryActivities[1].id, 25436);
    expect(model.lifeEntryActivities[2].activity.name, 'Chausson Pillsbury');
  });
}
