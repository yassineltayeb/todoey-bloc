part of 'task_widgets_imports.dart';

class TaskTile extends StatelessWidget {
  final TaskEntity task;
  final ValueChanged<bool?> onChange;

  const TaskTile({
    super.key,
    required this.task,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (builder) => AlertDialog(
                  title: const Text('Delete Task'),
                  content: Text(
                      'Are you sure you want to delete task \'${task.name}\'?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Provider.of<TaskData>(
                        //   context,
                        //   listen: false,
                        // ).deleteTask(task);
                        // Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    )
                  ],
                ));
      },
      title: Text(
        task.name,
        style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: onChange,
      ),
    );
  }
}
