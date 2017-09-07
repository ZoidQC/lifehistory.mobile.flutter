import 'package:flutter/material.dart';

import 'package:life_history_mobile/models/life_entry.dart';
import 'package:life_history_mobile/widgets/life_entry_activity_widget.dart';

export 'package:life_history_mobile/widgets/life_entry_activity_widget.dart';

class LifeEntryWidget extends StatelessWidget {
  LifeEntryWidget(this.life_entry);

  final LifeEntry life_entry;

  @override
  Widget build(BuildContext context) {
    List<Widget> life_entry_activities = <Widget>[];

    //Create activities widgets
    for (int i = 0; i < life_entry.life_entry_activities.length; i++) {
      life_entry_activities.add(
          new LifeEntryActivityWidget(life_entry.life_entry_activities[i]));
    }

    //Create hour text
    var timeTextStyle = new TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).backgroundColor);

    var timeWidgets = new List<Widget>();

    if (life_entry.startTime != null) {
      timeWidgets.add(new Text(
          "${life_entry.startTime.hourLabel}:${life_entry.startTime
              .minuteLabel}",
          style: timeTextStyle));
    }

    if (life_entry.endTime != null) {
      timeWidgets.add(new Text(
          "${life_entry.endTime.hourLabel}:${life_entry.endTime.minuteLabel}",
          style: timeTextStyle));
    }

    return new Card(
        child: new Container(
      margin: new EdgeInsets.all(12.0),
      child: new Row(
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(right: 8.0),
            child: new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: timeWidgets),
          ),
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: life_entry_activities,
          )),
        ],
      ),
    ));
  }
}
