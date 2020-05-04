import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './Tasks.dart';

class TaskList extends ChangeNotifier {
  SharedPreferences _prefs;

  TaskList() {
    initPreference();
  }
  List<Task> _tasks = [];

  UnmodifiableListView<Task> getTasks() {
    return _tasks;
  }

  Task getTask(int index) {
    return _tasks[index];
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    updatePreference();
  }

  void addTask(String newTaskTitle) {
    if (newTaskTitle != null) {
      _tasks.add(Task(title: newTaskTitle));
      updatePreference();
    }
    notifyListeners();
  }

  void updateStatus(int index) {
    _tasks[index].isdone = !_tasks[index].isdone;
    notifyListeners();
    updatePreference();
  }

  int getCount() {
    return _tasks.length;
  }

  initPreference() async {
    _prefs = await SharedPreferences.getInstance();
    var data = _prefs.getStringList('Tasks') ?? [];
    data.forEach((element) {
      var task = element.split('/');
      var fineTask;
      if (task[1] == 't') {
        fineTask = Task(isdone: true, title: task[0]);
      } else {
        fineTask = Task(isdone: false, title: task[0]);
      }
      _tasks.add(fineTask);
    });
  }

  updatePreference() async {
    List<String> storeData = [];
    String pluses = '';
    _tasks.forEach((data) {
      if (data.isdone == true) {
        pluses = '/t';
      } else {
        pluses = '/f';
      }
      storeData.add(data.title + pluses);
    });

    await _prefs.setStringList('Tasks', storeData);
  }
}
