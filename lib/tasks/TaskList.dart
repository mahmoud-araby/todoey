import 'dart:collection';

import 'package:flutter/cupertino.dart';

import './Tasks.dart';

class TaskList extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> gettasks() {
    return _tasks;
  }

  Task gettask(int index) {
    return _tasks[index];
  }

  void deletetask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void addtask(String newtasktitle) {
    _tasks.add(Task(title: newtasktitle));
    notifyListeners();
  }

  void updatestatus(int index) {
    _tasks[index].isdone = !_tasks[index].isdone;
    notifyListeners();
  }

  int getcount() {
    return _tasks.length;
  }
}
