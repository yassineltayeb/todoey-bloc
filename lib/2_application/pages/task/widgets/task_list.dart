part of 'task_widgets_imports.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.lightBlueAccent));
        } else if (state is TaskLoaded) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return TaskTile(
                task: task,
                onChange: (value) {
                  var task = state.tasks[index];
                  context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
                },
                // onChange: (value) => state.updateTask(task),
              );
            },
          );
        }
        return const Text('No Tasks to load');
      },
    );
  }
}
