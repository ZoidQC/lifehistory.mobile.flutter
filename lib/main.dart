import 'package:flutter/material.dart';
import 'package:life_history_mobile/pages_drawer/calendar.dart';
import 'package:life_history_mobile/pages_drawer/home.dart';
import 'package:life_history_mobile/pages_navigation/life_entry_page.dart';

void main() {
  runApp(new LifeHistoryApp());
}

class LifeHistoryApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    //Register page for navigation here
    LifeEntryPage.routeName: (BuildContext context) => new LifeEntryPage(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Life History',
      theme: new ThemeData(
        primaryColor: const Color.fromARGB(255, 23, 138, 204),
      ),
      home: new AppPage(),
      routes: routes,
    );
  }
}

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  AppPageState createState() => new AppPageState();
}

class AppPageState extends State<AppPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget _currentPage = new HomePage();

  void setCurrentPage(Widget page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Life History'),
      ),
      primary: true,
      body: _currentPage,
      drawer: new Drawer(
        child: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: <Color>[
              Theme.of(context).backgroundColor,
              Colors.white
            ], begin: FractionalOffset.topLeft),
          ),
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new Center(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: const FlutterLogo(),
                        padding: const EdgeInsets.only(right: 16.0),
                      ),
                      new Text('Life History',
                          style: Theme.of(context).textTheme.headline)
                    ],
                  ),
                ),
              ),
              new ClipRect(
                child: new Stack(
                  children: <Widget>[
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new ListTile(
                          leading: const CircleAvatar(child: const Text('H')),
                          title: const Text('Home'),
                          onTap: () {
                            setCurrentPage(new HomePage());
                            Navigator.of(context).pop();
                          },
                        ),
                        new ListTile(
                          leading: const CircleAvatar(child: const Text('C')),
                          title: const Text('Calendar'),
                          onTap: () {
                            setCurrentPage(new CalendarPage());
                            Navigator.of(context).pop();
                          },
                        ),
                        new ListTile(
                          leading: const CircleAvatar(child: const Text('S')),
                          title: const Text('Search'),
                          onTap: () {},
                        ),
                        new Divider(),
                        new Container(
                            child: new Text("Tools",
                                style: Theme.of(context).textTheme.subhead),
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 16.0, bottom: 8.0)),
                        new ListTile(
                          leading: const CircleAvatar(child: const Text('AT')),
                          title: const Text('Activity Types'),
                          onTap: () {},
                        ),
                        new ListTile(
                          leading: const CircleAvatar(child: const Text('A')),
                          title: const Text('Activities'),
                          onTap: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
