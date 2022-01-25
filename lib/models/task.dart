import 'package:todo_ui/data/database_helper.dart';

class TaskModel {
  int id;
  String title;
  bool isComplete;
  TaskModel({this.id,this.title, this.isComplete = false});
  TaskModel.fromMap(Map map){
    this.id=map['id'];
    this.title = map[SqlHelper.sqlHelper.titleColumnName];
    this.isComplete = map[SqlHelper.sqlHelper.titleColumnName];
  }
  toMap(){
    return {
      SqlHelper.sqlHelper.titleColumnName: this.title,
      SqlHelper.sqlHelper.isCompleteColumnName: this.isComplete ? 1 : 0
    };
  }
}
