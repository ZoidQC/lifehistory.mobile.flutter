import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:life_history_mobile/models/day.dart';

main() {
  test('JSON deserialization works for LifeEntry', () {
    var json = """
  {
  "date": "2017-10-03", 
  "id": 2476, 
  "life_entries": [
    {
      "day_id": 2476, 
      "end_time": null, 
      "id": 23816, 
      "life_entry_activities": [
        {
          "activity": {
            "activity_type": {
              "id": 3, 
              "name": "Old Data", 
              "show_quantity": false, 
              "show_rating": false
            }, 
            "id": 1427, 
            "name": "R\u00e9veil"
          }, 
          "description": null, 
          "id": 25443, 
          "life_entry_id": 23816, 
          "quantity": null, 
          "rating": null
        }
      ], 
      "start_time": "06:40:00"
    }, 
    {
      "day_id": 2476, 
      "end_time": "16:15:00", 
      "id": 23817, 
      "life_entry_activities": [
        {
          "activity": {
            "activity_type": {
              "id": 2, 
              "name": "Lieux", 
              "show_quantity": false, 
              "show_rating": false
            }, 
            "id": 1, 
            "name": "Working"
          }, 
          "description": "App", 
          "id": 25444, 
          "life_entry_id": 23817, 
          "quantity": null, 
          "rating": null
        }
      ], 
      "start_time": "07:45:00"
    }, 
    {
      "day_id": 2476, 
      "end_time": null, 
      "id": 23818, 
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
          "description": "R\u00e9chauff\u00e9", 
          "id": 25445, 
          "life_entry_id": 23818, 
          "quantity": 1.0, 
          "rating": 5
        }, 
        {
          "activity": {
            "activity_type": {
              "id": 1, 
              "name": "Nourriture", 
              "show_quantity": true, 
              "show_rating": true
            }, 
            "id": 387, 
            "name": "Biscuits"
          }, 
          "description": "\u00c9rables", 
          "id": 25446, 
          "life_entry_id": 23818, 
          "quantity": 3.0, 
          "rating": 6
        }
      ], 
      "start_time": "12:08:00"
    }, 
    {
      "day_id": 2476, 
      "end_time": null, 
      "id": 23819, 
      "life_entry_activities": [
        {
          "activity": {
            "activity_type": {
              "id": 4, 
              "name": "Avec", 
              "show_quantity": false, 
              "show_rating": false
            }, 
            "id": 1374, 
            "name": "Jonh Doe"
          }, 
          "description": null, 
          "id": 25447, 
          "life_entry_id": 23819, 
          "quantity": null, 
          "rating": null
        }
      ], 
      "start_time": "16:45:00"
    }, 
    {
      "day_id": 2476, 
      "end_time": null, 
      "id": 23820, 
      "life_entry_activities": [
        {
          "activity": {
            "activity_type": {
              "id": 9, 
              "name": "Sport", 
              "show_quantity": false, 
              "show_rating": false
            }, 
            "id": 1432, 
            "name": "Spikeball"
          }, 
          "description": "fun", 
          "id": 25448, 
          "life_entry_id": 23820, 
          "quantity": null, 
          "rating": null
        }
      ], 
      "start_time": "12:32:00"
    }, 
    {
      "day_id": 2476, 
      "end_time": null, 
      "id": 23821, 
      "life_entry_activities": [
        {
          "activity": {
            "activity_type": {
              "id": 1, 
              "name": "Nourriture", 
              "show_quantity": true, 
              "show_rating": true
            }, 
            "id": 246, 
            "name": "Poutine avec poulet (maison)"
          }, 
          "description": "", 
          "id": 25454, 
          "life_entry_id": 23821, 
          "quantity": 1.0, 
          "rating": 7
        }
      ], 
      "start_time": "17:25:00"
    }
  ], 
  "note": null
}
    """;
    var jsonMap = JSON.decode(json);
    var model = new Day.fromJson(jsonMap);

    expect(model.id, 2476);
    expect(model.note, null);
    expect(model.date, new DateTime(2017, 10, 03));
    expect(model.lifeEntries[1].id, 23817);
    expect(model.lifeEntries[2].lifeEntryActivities[0].id, 25445);
  });
}
