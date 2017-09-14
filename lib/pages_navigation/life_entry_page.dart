import 'package:flutter/material.dart';

class LifeEntryPage extends StatefulWidget {
  static String routeName = "/life_entry_page";

  @override
  _LifeEntryPageState createState() => new _LifeEntryPageState();
}

class _LifeEntryPageState extends State<LifeEntryPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Life Entry"),
      ),
    );
  }
}
