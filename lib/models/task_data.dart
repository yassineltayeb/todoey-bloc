import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  Future<void> getTasksFromLocalStorage() async {
    List<Task> tasks = [];
    var prefs = await SharedPreferences.getInstance();
    var listJson = prefs.getStringList('taskList') ?? [];
    tasks = listJson
        .map<Task>((json) => Task.fromJson((jsonDecode(json))))
        .toList();
    _tasks = [];
    _tasks.addAll(tasks);
    notifyListeners();
  }

  addTask(String newTaskTitle) async {
    final Task task = Task(name: newTaskTitle);
    _tasks.add(task);

    await saveTasksToLocalStorage();

    notifyListeners();
  }

  updateTask(Task task) async {
    task.toggleDone();
    await saveTasksToLocalStorage();
    notifyListeners();
  }

  deleteTask(Task task) async {
    _tasks.remove(task);
    await saveTasksToLocalStorage();
    notifyListeners();
  }

  saveTasksToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = _tasks.map((obj) => jsonEncode(obj)).toList();
    await prefs.setStringList(
        'taskList', taskJson.map((e) => e.toString()).toList());
  }
}
