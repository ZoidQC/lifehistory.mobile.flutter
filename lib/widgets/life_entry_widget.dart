import 'package:flutter/material.dart';
import 'package:life_history_mobile/models/life_entry.dart';
import 'package:life_history_mobile/widgets/life_entry_activity_widget.dart';

export 'package:life_history_mobile/widgets/life_entry_activity_widget.dart';

class LifeEntryWidget extends StatelessWidget {
  LifeEntryWidget(this.lifeEntry, this.animationController);

  final LifeEntry lifeEntry;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    List<Widget> lifeEntryActivities = <Widget>[];

    //Create activities widgets
    for (int i = 0; i < lifeEntry.lifeEntryActivities.length; i++) {
      lifeEntryActivities
          .add(new LifeEntryActivityWidget(lifeEntry.lifeEntryActivities[i]));
    }

    //Create hour text
    var timeTextStyle = new TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).backgroundColor);

    var timeWidgets = new List<Widget>();

    if (lifeEntry.startTime != null) {
      timeWidgets.add(new Text(
          "${lifeEntry.startTime.hourLabel}:${lifeEntry.startTime
              .minuteLabel}",
          style: timeTextStyle));
    }

    if (lifeEntry.endTime != null) {
      timeWidgets.add(new Text(
          "${lifeEntry.endTime.hourLabel}:${lifeEntry.endTime.minuteLabel}",
          style: timeTextStyle));
    }

    return new FadeTransition(
      opacity: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      child: new Card(
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
              children: lifeEntryActivities,
            )),
          ],
        ),
      )),
    );
  }
}
