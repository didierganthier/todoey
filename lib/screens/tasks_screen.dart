import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
    Task(name: 'Walk the dog')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 5.0,
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: (){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => FractionallySizedBox(
                heightFactor: 0.65,
                child: AddTaskScreen(
                    (newValue){
                      setState(() {
                        tasks.add(Task(name: newValue, isDone: false));
                      });
                      Navigator.pop(context);
                    }
                ),
              )
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(height:10.0),
                Text('Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700
                  ),
                ),
                Text('${tasks.length.toString()} tasks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
              ),
              child: TasksList(tasks: tasks),
            ),
          )
        ],
      ),
    );
  }
}