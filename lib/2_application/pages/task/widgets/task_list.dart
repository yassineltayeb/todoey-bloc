part of 'task_widgets_imports.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.tasks.length,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            task: task,
            onChange: (value) => taskData.updateTask(task),
          );
        },
      );
    });
  }
}
