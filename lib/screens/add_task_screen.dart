import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget{

  final Function addTaskCallback;

  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
               color: Colors.lightBlueAccent,
               fontSize: 30.0,
              fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
            FlatButton(
              onPressed: (){
                addTaskCallback(newTaskTitle);
              },
              child: Text('Add',
              style: TextStyle(
                 color: Colors.white
                ),
              ),
              color: Colors.lightBlueAccent,)
          ],
        ),
      ),
    );
  }
}
