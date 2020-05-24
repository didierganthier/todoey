import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child){
        return ListView.builder(itemBuilder: (context, index){
          final task = taskdata.tasks[index];
          return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState){
                taskdata.updateTask(task);
              },
            longPressCallback: (){
              taskdata.deleteTask(task);
            },
            );
          },
          itemCount: taskdata.taskcount,
        );
      },
    );
  }
}