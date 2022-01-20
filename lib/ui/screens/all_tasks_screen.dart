import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/provider/todo_provider.dart';
import 'package:todo_ui/ui/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  AllTasksScreen();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: Provider.of<TodoProvider>(context).allTasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(Provider.of<TodoProvider>(context).allTasks[index]);
        });
  }
}
