import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:life_history_mobile/models.dart';

main() {
  test('JSON deserialization works for Activity', () {
    var json = """
  {
    "activity_type": {
      "id": 1, 
      "name": "Nourriture", 
      "show_quantity": true, 
      "show_rating": true
    }, 
    "id": 342, 
    "name": "Chausson Pillsbury"
  }
    """;
    var jsonMap = JSON.decode(json);
    var model = new Activity.fromJson(jsonMap);

    expect(model.name, 'Chausson Pillsbury');
    expect(model.activityType.name, 'Nourriture');
  });
}
