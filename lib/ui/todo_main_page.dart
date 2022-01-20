import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/provider/todo_provider.dart';
import 'package:todo_ui/router_class.dart';
import 'package:todo_ui/ui/screens/all_tasks_screen.dart';
import 'package:todo_ui/ui/screens/complete_tasks_screen.dart';
import 'package:todo_ui/ui/screens/inComplete_tasks_screen.dart';
import 'package:todo_ui/ui/screens/new_task_screen.dart';

class TodoMainPage extends StatefulWidget {
  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  initTabController() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            appBar: AppBar(
              title: Text('TODO APP'),
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Icon(Icons.list),
                  Icon(Icons.done),
                  Icon(Icons.cancel),
                ],
              ),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text("anas abu shanab"),
                    accountEmail: Text("anas.shanab.2000@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _tabController.animateTo(0);
                    },
                    title: Text("All Tasks Screen"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _tabController.animateTo(1);
                    },
                    title: Text("Complete Tasks Screen"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _tabController.animateTo(2);
                    },
                    title: Text("InComplete Tasks Screen"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                AllTasksScreen(),
                CompleteTasksScreen(),
                InCompleteTasksScreen(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                RouterClass.routerClass.pushToScreenByName('add_task');
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('TODO APP'),
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Icon(Icons.list),
                  Icon(Icons.done),
                  Icon(Icons.cancel),
                ],
              ),
            ),
            body: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Text("anas abu shanab"),
                        accountEmail: Text("anas.shanab.2000@gmail.com"),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          _tabController.animateTo(0);
                        },
                        title: Text("All Tasks Screen"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          _tabController.animateTo(1);
                        },
                        title: Text("Complete Tasks Screen"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          _tabController.animateTo(2);
                        },
                        title: Text("InComplete Tasks Screen"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AllTasksScreen(),
                      CompleteTasksScreen(),
                      InCompleteTasksScreen(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
