part of 'task_bloc.dart';

@immutable
sealed class TaskEvent extends Equatable {
  List<Object?> get props => [];
}

 class GetTasksEvent extends TaskEvent {
  // final List<TaskEntity> tasks;

  GetTasksEvent();

  @override
  List<Object?> get props => [];
}

sealed class AddTaskEvent extends TaskEvent {
  final TaskEntity task;

  AddTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

sealed class DeleteTaskEvent extends TaskEvent {
  final TaskEntity task;

  DeleteTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}
