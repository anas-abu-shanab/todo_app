import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:todo_ui/models/task.dart';

class TodoProvider extends ChangeNotifier{
  GlobalKey<FormState> taskForm = GlobalKey<FormState>();
  List<TaskModel> allTasks = [

  ];

  getCompleteTasks(){
    return allTasks
        .where((element) => element.isComplete)
        .toList();
  }

  getInCompleteTasks(){
    return allTasks
        .where((element) => !element.isComplete)
        .toList();
  }

  addTask(TaskModel task){
    log("test");
    allTasks.add(task);
    notifyListeners();
  }
  editTask(TaskModel task,bool isCompelte){
    task.isComplete = isCompelte;
    notifyListeners();
  }
  deleteTask(TaskModel task){
    allTasks.remove(task);
    log(task.title);
    notifyListeners();
  }
}