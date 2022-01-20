
import 'package:flutter/material.dart';
import 'package:todo_ui/main.dart';
import 'package:todo_ui/ui/screens/new_task_screen.dart';

class RouterClass{
  RouterClass._();
  static RouterClass routerClass = RouterClass._();

  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  pushToScreenByName(String screenName){
    navKey.currentState.pushNamed(screenName);
  }

  pushToScreenByWidget(Widget widget){
    BuildContext context = navKey.currentContext;
    navKey.currentState.push(MaterialPageRoute(builder: (context){
      return widget;
    }));
  }

  popScreen(){
    navKey.currentState.pop();
  }

  Map<String, Widget Function(BuildContext)> myRoutes = {
    'screen1' : (context)=> Screen1(),
    'screen2' : (context)=> Screen2(),
    'add_task' : (context)=> NewTaskScreen(),
  };
}