import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../tasks/TaskList.dart';

import '../constants.dart';

class TaskAdd extends StatefulWidget {
  @override
  _TaskAddState createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  String newtask;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.1),
      child: Container(
          decoration: klistdecoration,
          child: Column(
            children: <Widget>[
              Text('Enter Task name'),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newtask = value;
                },
              ),
              FlatButton(
                color: Colors.cyan,
                onPressed: () {
                  Provider.of<TaskList>(context, listen: false)
                      .addtask(newtask);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add Task',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
