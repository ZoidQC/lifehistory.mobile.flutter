import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child: new Container(
                child: new FlatButton(
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1990),
                          lastDate: new DateTime(2100));
                    },
                    child: new Text('Show calendar')))));
  }
}
