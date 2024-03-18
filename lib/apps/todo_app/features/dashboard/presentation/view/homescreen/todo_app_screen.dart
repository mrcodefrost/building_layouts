import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/provider/local/todo_database.dart';
import 'widget/todo_custom_button.dart';

class TodoAppScreen extends StatefulWidget {
  const TodoAppScreen({super.key});

  @override
  State<TodoAppScreen> createState() => _TodoAppScreenState();
}

class _TodoAppScreenState extends State<TodoAppScreen> {
  // reference for hive box
  final _myBox = Hive.box('todoAppBox');

  // instance of database
  final TodoDatabase _db = TodoDatabase();

  @override
  void initState() {
    super.initState();

    // first ever opening, then create a default data
    if (_myBox.get("TODOLIST") == null) {
      _db.createInitialData();
    } else {
      // there already exists data
      _db.loadData();
    }
  }

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      _db.todoList[index][1] = !_db.todoList[index][1];
    });
    _db.updateDatabase();
  }

  // text input controller
  final _controller = TextEditingController();

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.indigo[100],
              content: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // user input
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add a new task",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          text: 'Save',
                          onPressed: () {
                            // method to save new task
                            setState(() {
                              _db.todoList.add([_controller.text, false]);
                              _controller.clear();
                            });
                            Navigator.of(context).pop();
                            _db.updateDatabase();
                          },
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        CustomButton(
                            text: 'Cancel',
                            onPressed: () => Navigator.of(context).pop()),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  void deleteTask(int index) {
    setState(() {
      _db.todoList.removeAt(index);
    });
    _db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[200],
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade100,
          title: const Text('Todo'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo[100],
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: _db.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskCompleted: _db.todoList[index][1],
                taskName: _db.todoList[index][0],
                onChanged: (value) {
                  return checkBoxChanged(value, index);
                },
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskCompleted,
    required this.taskName,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
