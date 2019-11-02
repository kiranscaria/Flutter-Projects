import 'package:flutter/material.dart';
import 'models/task_data.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return Dismissible(
            key: Key(UniqueKey().toString()),
            child: CheckboxListTile(
              activeColor: Colors.lightBlueAccent,
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              value: task.isCompleted,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (bool newValue) {
                taskData.updateTask(task);
              },
            ),
            onDismissed: (direction) {
              final deletedTask = taskData.deleteTask(index);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("${deletedTask.title} dismissed"),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    taskData.addTask(deletedTask);
                  },
                ),
              ));
            },
          );
        },
      );
    });
  }
}
