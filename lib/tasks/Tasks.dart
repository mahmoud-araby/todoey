import 'package:flutter/cupertino.dart';

class Task {
  Task({@required this.title, this.isdone = false});
  String title;
  bool isdone;
}
