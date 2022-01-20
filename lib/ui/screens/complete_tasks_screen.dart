import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/provider/todo_provider.dart';
import 'package:todo_ui/ui/widgets/task_widget.dart';

class CompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider.of<TodoProvider>(context).allTasks.where((element) => element.isComplete).length == 0
        ? Center(
            child: Lottie.asset('assets/lottie/empty.json',width: 300),
          )
        : ListView.builder(
            itemCount: Provider.of<TodoProvider>(context).allTasks.where((element) => element.isComplete).length,
            itemBuilder: (context, index) {
              return TaskWidget(
                  Provider.of<TodoProvider>(context).allTasks
                      .where((element) => element.isComplete)
                      .toList()[index]);
            });
  }
}
