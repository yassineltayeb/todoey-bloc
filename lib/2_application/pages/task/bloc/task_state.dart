part of 'task_bloc.dart';

@immutable
sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskLoaded extends TaskState {
  final List<TaskEntity> tasks;
  const TaskLoaded({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

final class TaskError extends TaskState {
  final String message;

  const TaskError({required this.message});

  @override
  List<Object?> get props => [message];
}
