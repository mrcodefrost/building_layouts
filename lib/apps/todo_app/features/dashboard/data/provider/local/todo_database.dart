import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  // List<List<dynamic> cam be used however, then a null check will need to added in the loadData() method
  // like
  // void loadData() {
  //   dynamic data = _myBox.get("TODOLIST");
  //   if (data != null && data is List<dynamic>) {
  //     todoList = List<List<dynamic>>.from(data);
  //   }
  // }

  List<List<dynamic>> todoList = [];

  final _myBox = Hive.box('todoAppBox');

  // run this method if this is the first time ever opening this app
  void createInitialData() {
    todoList = [
      ["Make a Todo", false]
    ];
  }

  // update the database
  // the key todolist will be created
  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }

  // load the data from the database
  // if key not found then returns null

  void loadData() {
    var data = _myBox.get("TODOLIST");

    // If you're getting an error saying "type 'List<dynamic>' is not a subtype of type 'List<List<dynamic>>'",
    // it means that the data returned from _myBox.get("TODOLIST") is inferred as List<dynamic> instead of List<List<dynamic>>.
    // In Dart, type inference is based on the first value encountered in the list.
    // If you haven't stored any data in the "TODOLIST" key yet, it might infer it as a list of dynamic values.
    // You can explicitly specify the type when retrieving data from the box to avoid type inference issues

    if (data is List<List<dynamic>>) {
      todoList = List<List<dynamic>>.from(data);
    }
  }
}
