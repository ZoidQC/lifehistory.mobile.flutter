import 'package:flutter/material.dart';

import 'package:life_history_mobile/models/life_entry_activity.dart';

class LifeEntryActivityWidget extends StatelessWidget {
  LifeEntryActivityWidget(this.life_entry_activity);

  final LifeEntryActivity life_entry_activity;

  @override
  Widget build(BuildContext context) {
    var widgets = new List<Widget>();

    //Activity + Description
    widgets.add(new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(life_entry_activity.activity,
            style: Theme.of(context).textTheme.subhead),
        new Text(life_entry_activity.description,
            style: Theme.of(context).textTheme.caption),
      ],
    ));

    //Add quantity if > 0
    widgets.add(new Expanded(
      child: new Align(
        alignment: FractionalOffset.centerLeft,
        child: new Container(
          child: life_entry_activity.quantity != null &&
                  life_entry_activity.quantity > 1
              ? new CircleAvatar(
                  child: new Text(
                    "${life_entry_activity.quantity}",
                    style: new TextStyle(fontSize: 14.0),
                  ),
                  backgroundColor: Theme.of(context).backgroundColor,
                )
              : null,
          height: 22.0,
          margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        ),
      ),
    ));

    //Add rating if not null
    if (life_entry_activity.rating != null) {
      widgets.add(new Row(
        children: <Widget>[
          new Icon(
            Icons.star,
            color: Theme.of(context).backgroundColor,
          ),
          new Text("${life_entry_activity.rating}"),
        ],
      ));
    }

    return new Container(
      margin: new EdgeInsets.all(8.0),
      child: new Row(
        children: widgets,
      ),
    );
  }
}
