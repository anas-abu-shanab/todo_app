import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:todo_ui/models/task.dart';

class TodoProvider extends ChangeNotifier{
  GlobalKey<FormState> taskForm = GlobalKey<FormState>();
  List<Task> allTasks = [

  ];

  addTask(Task task){
    log("test");
    allTasks.add(task);
    notifyListeners();
  }
  editTask(Task task,bool isCompelte){
    task.isComplete = isCompelte;
    notifyListeners();
  }
  deleteTask(Task task){
    allTasks.remove(task);
    log(task.title);
    notifyListeners();
  }
}