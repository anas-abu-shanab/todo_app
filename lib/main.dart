

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/provider/todo_provider.dart';
import 'package:todo_ui/router_class.dart';
import 'package:todo_ui/ui/todo_main_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>TodoProvider(),
    child: ScreenUtilInit(
      designSize: Size(393, 804),
      minTextAdapt: true,
      builder: () => MaterialApp(
        navigatorKey: RouterClass.routerClass.navKey,
        home: TodoMainPage(),
        debugShowCheckedModeBanner: false,
        routes: RouterClass.routerClass.myRoutes,
      ),
    ),
  ));
}

class Responsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green.shade300,
        width: 200.w,
        height: 400.h,
        child: CircleAvatar(
          radius: 20.r,
          child: Text("anas",style: TextStyle(fontSize: 18.sp),),
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text("go to sceen 2"),
          onPressed: () async {
            RouterClass.routerClass.pushToScreenByName('screen2');
          },
        ),
      ),
    );
  }
}


class Screen2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop("thes message frome Screen 2");
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Screen 2"),
        ),
      ),
    );
  }
}

