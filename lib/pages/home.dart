import 'package:flutter/material.dart';

import 'package:life_history_mobile/models/life_entry.dart';
import 'package:life_history_mobile/models/life_entry_activity.dart';
import 'package:life_history_mobile/widgets/life_entry_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Create test data
  final List<LifeEntryWidget> _entries = <LifeEntryWidget>[
    new LifeEntryWidget(new LifeEntry(
        startTime: new TimeOfDay(hour: 8, minute: 0),
        endTime: null,
        life_entry_activities: <LifeEntryActivity>[
          new LifeEntryActivity(activity: "Réveil", description: ""),
        ])),
    new LifeEntryWidget(new LifeEntry(
        startTime: new TimeOfDay(hour: 9, minute: 45),
        endTime: new TimeOfDay(hour: 10, minute: 30),
        life_entry_activities: <LifeEntryActivity>[
          new LifeEntryActivity(
              activity: "Ferme O-Lac",
              description: "Aller voir parents à Josy"),
        ])),
    new LifeEntryWidget(new LifeEntry(
        startTime: new TimeOfDay(hour: 13, minute: 55),
        endTime: null,
        life_entry_activities: <LifeEntryActivity>[
          new LifeEntryActivity(
              activity: "Croissants",
              description: "Pâtisserie Mergeay",
              quantity: 3,
              rating: 7),
          new LifeEntryActivity(
              activity: "Frittes", description: "McDo", quantity: 1, rating: 8)
        ])),
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(left: 16.0, top: 32.0, bottom: 16.0),
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(right: 16.0),
                    child: new CircleAvatar(child: new Text('28')),
                  ),
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("August 28, 2017",
                            style: Theme.of(context).textTheme.title),
                        new Text("Monday",
                            style: Theme.of(context).textTheme.caption),
                      ])
                ],
              ),
            ),
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _entries[index],
                itemCount: _entries.length,
              ),
            )
          ],
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: <Color>[Theme.of(context).backgroundColor, Colors.white],
              begin: FractionalOffset.topLeft),
        ));
  }
}
