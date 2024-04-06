import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga_app/practice/tasks_model.dart';

class TaskManager {
  static const _key = "tasks";

  //write function to add task
  Future<void> addTask(Task task) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> tasksList = prefs.getStringList(_key) ?? [];
    tasksList.add(json.encode(task.toJson()));
    await prefs.setStringList(_key, tasksList);
  }


  // write function to remove task
  Future<void> removeTask(Task task) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String> tasksList = preferences.getStringList(_key) ?? [];
    tasksList.removeWhere((taskJson){
      final taskData = json.decode(taskJson);
      return taskData['title'] == task.title && taskData['isCompleted'];
    });
    await preferences.setStringList(_key, tasksList);
  }

}