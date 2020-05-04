import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tasks/TaskList.dart';

class TodoListView extends StatelessWidget {
  TodoListView({this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(
      builder: (context, taskList, child) {
        return Dismissible(
          key: Key(taskList.getTask(index).title),
          onDismissed: (direction) {
            taskList.deleteTask(index);
          },
          child: ListTile(
            title: Text(
              taskList.getTask(index).title,
              style: TextStyle(
                decoration: taskList.getTask(index).isdone
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            trailing: Checkbox(
              value: taskList.getTask(index).isdone,
              onChanged: (value) {
                taskList.updateStatus(index);
              },
            ),
          ),
        );
      },
    );
  }
}
