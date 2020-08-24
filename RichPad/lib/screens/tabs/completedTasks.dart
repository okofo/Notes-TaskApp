import 'package:RichPad/provider/taskProvider.dart';
import 'package:RichPad/utils/taskList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CompletedTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TaskProvider>(
        builder: (context, todos, child) => TaskList(
              tasks: todos.completedTasks,
            ),
      ),
    );
  }
}