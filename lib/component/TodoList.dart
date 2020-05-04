import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../tasks/TaskList.dart';

class TodoListView extends StatelessWidget {
  TodoListView({this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(
      builder: (context, TaskList, child) {
        return Dismissible(
          key: Key(TaskList.gettask(index).title),
          onDismissed: (direction) {
            TaskList.deletetask(index);
          },
          child: ListTile(
            title: Text(
              TaskList.gettask(index).title,
              style: TextStyle(
                decoration: TaskList.gettask(index).isdone
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            trailing: Checkbox(
              value: TaskList.gettask(index).isdone,
              onChanged: (value) {
                TaskList.updatestatus(index);
              },
            ),
          ),
        );
      },
    );
  }
}
