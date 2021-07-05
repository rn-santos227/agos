import 'package:agos/views/pages/create.dart';
import 'package:agos/views/pages/dashboard.dart';
import 'package:agos/views/pages/list.dart';
import 'package:agos/views/pages/people.dart';
import 'package:agos/views/pages/published.dart';
import 'package:agos/widgets/drawer/drawer_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final drawerItems = [
    new DrawerItem("Dashboard", Icons.dashboard),
    new DrawerItem("Create Form", Icons.article),
    new DrawerItem("Published", Icons.article_outlined),
    new DrawerItem("Responses", Icons.assignment_turned_in),
    new DrawerItem("People", Icons.people)
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  String _title = "Dashboard";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new DashboardPage(); 
      case 1:
        return new CreatePage();
      case 2:
        return new ListPage();
      case 3:
        return new PublishedPage();
      case 4:
        return new PeoplePage();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index, String title) {
    setState(() => {
      _title = title,
      _selectedDrawerIndex = index
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i, d.title),
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon( Icons.logout, size: 26.0)
            )
          )
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Agos Navigation Bar"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex)
    );
  }
}