import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/TodoList.dart';
import '../constants.dart';
import '../tasks/TaskList.dart';
import 'addtask.dart';

class Todoey extends StatefulWidget {
  @override
  _TodoeyState createState() => _TodoeyState();
}

class _TodoeyState extends State<Todoey> {
  Widget listBuilder(BuildContext context, int index) {
    return TodoListView(
      index: index,
    );
  }

  showaddtask() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return TaskAdd();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showaddtask();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 28,
                  child: Icon(
                    Icons.menu,
                    size: 28,
                  ),
                ),
                Text(
                  'Todoey',
                  style: kmainfont,
                ),
                Text(
                  '${Provider.of<TaskList>(context).getCount()} tasks',
                  style: ksecstyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: klistdecoration,
              padding: EdgeInsets.only(
                left: 50,
                top: 25,
              ),
              child: ListView.builder(
                itemBuilder: listBuilder,
                itemCount: Provider.of<TaskList>(context).getCount(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
