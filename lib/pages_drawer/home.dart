import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_history_mobile/models/life_entry.dart';
import 'package:life_history_mobile/models/life_entry_activity.dart';
import 'package:life_history_mobile/utils/routing_assistant.dart';
import 'package:life_history_mobile/widgets/life_entry_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<LifeEntryWidget> entries;

  @override
  Widget build(BuildContext context) {
    //Create test data
    entries = createTestData();

    //Add day header
    List<Widget> _listViewItems = <Widget>[
      new Container(
        margin: const EdgeInsets.only(left: 16.0, top: 32.0, bottom: 16.0),
        child: new Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: const Text('28'),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "August 28, 2017",
                  style: Theme.of(context).textTheme.title,
                ),
                new Text(
                  "Monday",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            )
          ],
        ),
      ),
    ];

    //Add life entries
    _listViewItems.addAll(entries);

    //Add space at bottom to not hide right part of last card
    _listViewItems.add(new Container(
      height: 75.0,
    ));

    //Start animations
    int duration = 0;

    for (var entry in entries) {
      new Timer(new Duration(milliseconds: duration),
          entry.animationController.forward);
      duration += 100;
    }

    return new Scaffold(
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => _listViewItems[index],
                itemCount: _listViewItems.length,
              ),
            )
          ],
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: <Color>[Theme.of(context).backgroundColor, Colors.white],
              begin: FractionalOffset.topLeft),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(RoutingAssistant.lifeEntryPage(null));
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var entry in entries) entry.animationController.dispose();

    super.dispose();
  }

  AnimationController _createAnimationController() {
    return new AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );
  }

  List<LifeEntryWidget> createTestData() {
    return <LifeEntryWidget>[
      new LifeEntryWidget(
          new LifeEntry(
              startTime: new TimeOfDay(hour: 8, minute: 0),
              endTime: null,
              lifeEntryActivities: <LifeEntryActivity>[
                new LifeEntryActivity(activity: "Réveil", description: ""),
              ]),
          _createAnimationController()),
      new LifeEntryWidget(
          new LifeEntry(
            startTime: new TimeOfDay(hour: 9, minute: 45),
            endTime: new TimeOfDay(hour: 10, minute: 30),
            lifeEntryActivities: <LifeEntryActivity>[
              new LifeEntryActivity(
                  activity: "Ferme O-Lac",
                  description: "Aller voir parents à Josy"),
            ],
          ),
          _createAnimationController()),
      new LifeEntryWidget(
          new LifeEntry(
            startTime: new TimeOfDay(hour: 13, minute: 55),
            endTime: null,
            lifeEntryActivities: <LifeEntryActivity>[
              new LifeEntryActivity(
                  activity: "Croissants",
                  description: "Pâtisserie Mergeay",
                  quantity: 3,
                  rating: 7),
              new LifeEntryActivity(
                  activity: "Frittes",
                  description: "McDo",
                  quantity: 1,
                  rating: 8)
            ],
          ),
          _createAnimationController()),
      new LifeEntryWidget(
          new LifeEntry(
            startTime: new TimeOfDay(hour: 19, minute: 22),
            endTime: null,
            lifeEntryActivities: <LifeEntryActivity>[
              new LifeEntryActivity(
                activity: "PlayerUnknown's Battleground",
                description: "",
              ),
              new LifeEntryActivity(
                activity: "Steeven Thériault",
                description: "Discord",
              )
            ],
          ),
          _createAnimationController()),
      new LifeEntryWidget(
          new LifeEntry(
            startTime: new TimeOfDay(hour: 19, minute: 22),
            endTime: null,
            lifeEntryActivities: <LifeEntryActivity>[
              new LifeEntryActivity(
                activity: "Jessica Jones",
                description: "S1E5",
                quantity: 1,
                rating: 7,
              ),
            ],
          ),
          _createAnimationController()),
      new LifeEntryWidget(
          new LifeEntry(
            startTime: new TimeOfDay(hour: 21, minute: 44),
            endTime: null,
            lifeEntryActivities: <LifeEntryActivity>[
              new LifeEntryActivity(
                activity: "Pringles",
                description: "Sel et vinaigre",
                quantity: 1,
                rating: 8,
              ),
            ],
          ),
          _createAnimationController()),
      new LifeEntryWidget(
          new LifeEntry(
            startTime: new TimeOfDay(hour: 23, minute: 24),
            endTime: null,
            lifeEntryActivities: <LifeEntryActivity>[
              new LifeEntryActivity(
                activity: "Dans le lit",
                description: "Cell + Dormir",
              ),
            ],
          ),
          _createAnimationController()),
    ];
  }
}
