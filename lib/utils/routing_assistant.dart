import 'package:flutter/material.dart';
import 'package:life_history_mobile/models/life_entry.dart';
import 'package:life_history_mobile/pages_navigation/life_entry_page.dart';

class RoutingAssistant {
  static MaterialPageRoute lifeEntryPage(LifeEntry lifeEntry) {
    return new MaterialPageRoute(
      builder: (_) => new LifeEntryPage(lifeEntry),
    );
  }
}
