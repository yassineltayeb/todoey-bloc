part of 'task_widgets_imports.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    String taskName = '';

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w400,
              fontSize: 30,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                  width: 5,
                ),
              ),
            ),
            onChanged: (textInputValue) {
              taskName = textInputValue;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: TextButton(
              autofocus: true,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 25,
                  )),
              onPressed: () {
                var task = TaskEntity(name: taskName, isDone: false);
                context.read<TaskBloc>().add(AddTaskEvent(task: task));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }
}
