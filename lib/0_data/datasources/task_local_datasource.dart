import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/0_data/models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getTasksFromLocalStorage();
  Future<TaskModel> addTaskToLocalStorage(TaskModel task);
  Future<TaskModel> deleteTaskFromLocalStorage(TaskModel task);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  @override
  Future<List<TaskModel>> getTasksFromLocalStorage() async {
    List<TaskModel> tasks = [];
    var prefs = await SharedPreferences.getInstance();
    var taskListJson = prefs.getStringList('taskList') ?? [];
    tasks = taskListJson
        .map<TaskModel>((json) => TaskModel.fromJson((jsonDecode(json))))
        .toList();

    return tasks;
  }

  Future<TaskModel> addTaskToLocalStorage(TaskModel task) async {
    final tasks = await getTasksFromLocalStorage();
    tasks.add(task);

    await _saveTasksToLocalStorage(tasks);

    return task;
  }

  Future<TaskModel> deleteTaskFromLocalStorage(TaskModel task) async {
    final tasks = await getTasksFromLocalStorage();
    tasks.remove(task);

    await _saveTasksToLocalStorage(tasks);

    return task;
  }

  _saveTasksToLocalStorage(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = tasks.map((obj) => jsonEncode(obj)).toList();
    await prefs.setStringList(
        'taskList', taskJson.map((e) => e.toString()).toList());
  }
}
