import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/Todoey.dart';
import './tasks/TaskList.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskList(),
      child: MaterialApp(
        title: "Todo",
        home: Scaffold(body: Todoey()),
      ),
    );
  }
}
