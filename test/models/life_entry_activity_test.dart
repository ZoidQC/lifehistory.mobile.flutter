import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:life_history_mobile/models/life_entry_activity.dart';

main() {
  test('JSON deserialization works for LifeEntryActivity', () {
    var json = """
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
    """;
    var jsonMap = JSON.decode(json);
    var model = new LifeEntryActivity.fromJson(jsonMap);

    expect(model.id, 25437);
    expect(model.activity.name, 'Chausson Pillsbury');
    expect(model.activity.activityType.name, 'Nourriture');
  });
}
