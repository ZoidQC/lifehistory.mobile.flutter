import 'package:flutter/material.dart';
import 'package:life_history_mobile/models/life_entry.dart';

class LifeEntryPage extends StatefulWidget {
  LifeEntryPage(this.lifeEntry);
  final LifeEntry lifeEntry;

  @override
  _LifeEntryPageState createState() => new _LifeEntryPageState(lifeEntry);
}

class _LifeEntryPageState extends State<LifeEntryPage> {
  _LifeEntryPageState(this.lifeEntry);
  final LifeEntry lifeEntry;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(lifeEntry != null ? lifeEntry.startTime.toString() : "null"),
      ),
    );
  }
}
