import 'package:flutter/material.dart';

import 'package:life_history_mobile/models/life_entry_activity.dart';

class LifeEntryActivityWidget extends StatelessWidget {
  LifeEntryActivityWidget(this.lifeEntryActivity);

  final LifeEntryActivity lifeEntryActivity;

  @override
  Widget build(BuildContext context) {
    var widgets = new List<Widget>();

    //Activity + Description
    widgets.add(
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(lifeEntryActivity.activity,
              style: Theme.of(context).textTheme.subhead),
          new Text(lifeEntryActivity.description,
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    );

    //Add quantity if > 0
    widgets.add(
      new Expanded(
        child: new Align(
          alignment: FractionalOffset.centerLeft,
          child: new Container(
            child: lifeEntryActivity.quantity != null &&
                    lifeEntryActivity.quantity > 1
                ? new CircleAvatar(
                    child: new Text(
                      "${lifeEntryActivity.quantity}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
                  )
                : null,
            height: 22.0,
            margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          ),
        ),
      ),
    );

    //Add rating if not null
    if (lifeEntryActivity.rating != null) {
      widgets.add(new Row(
        children: <Widget>[
          new Icon(
            Icons.star,
            color: Theme.of(context).backgroundColor,
          ),
          new Text("${lifeEntryActivity.rating}"),
        ],
      ));
    }

    return new Container(
      margin: const EdgeInsets.all(8.0),
      child: new Row(
        children: widgets,
      ),
    );
  }
}
