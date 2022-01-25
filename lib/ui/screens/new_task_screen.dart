import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/provider/todo_provider.dart';

import '../../router_class.dart';

class NewTaskScreen extends StatefulWidget {

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isComlete = false;
  String title = "";

  GlobalKey<FormState> taskForm = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context,provider,x){
        return Scaffold(
          appBar: AppBar(
            title: Text("New Task"),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 10.h),
            child: Form(
              key: taskForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value.isEmpty){
                        return 'This field is required';
                      }else{
                        for(int i=0;i<provider.allTasks.length;i++){
                          if(value==provider.allTasks[i].title){
                            return "This task already exists";
                          }
                        }
                      }
                      return null;
                    },
                    onSaved: (value){
                      title = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    onChanged: (value){
                      title = value;
                    },
                  ),
                  SizedBox(height: 10.h,),
                  CheckboxListTile(
                    value: isComlete,
                    title: Text("I have comlete this task"),
                    onChanged: (value){
                      isComlete = value;
                      setState(() {

                      });
                    },
                  ),
                  SizedBox(height: 30.h,),
                  InkWell(
                    onTap: (){
                      bool isSuccess = taskForm.currentState.validate();
                      if(isSuccess){
                        taskForm.currentState.save();
                        TaskModel task = TaskModel(title: title,isComplete: isComlete);
                        provider.addTask(task);
                        RouterClass.routerClass.popScreen();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text("add new task",
                        style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
