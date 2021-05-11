import 'package:agos/helpers/database_helper.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

      ),
    );
  }
}