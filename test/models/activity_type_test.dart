import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:life_history_mobile/models/activity_type.dart';

main() {
  test('JSON deserialization works for ActivityType', () {
    var json = """
      {
      "id": 1, 
      "name": "Nourriture", 
      "show_quantity": true, 
      "show_rating": true
    }
    """;
    var jsonMap = JSON.decode(json);
    var model = new ActivityType.fromJson(jsonMap);

    expect(model.name, 'Nourriture');
    expect(model.showQuantity, true);
  });
}
