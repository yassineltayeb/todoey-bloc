import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todoey/1_domain/entities/task_entity.dart';
import 'package:todoey/1_domain/usecases/task_usecases.dart';

import '../../../../1_domain/failures/failures.dart';

part 'task_event.dart';
part 'task_state.dart';

const generalFailureMessage = 'Something went wrong, please try again';
const serverFailureMessage = 'Internal server error';
const cacheFailureMessage = 'Cache error';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskUseCases taskUseCases;

  TaskBloc({required this.taskUseCases}) : super(TaskInitial()) {
    on<GetTasksEvent>((event, emit) async {
      emit(TaskLoading());
      await Future.delayed(const Duration(seconds: 5));
      var failureOrTasks = await taskUseCases.getTasks();
      failureOrTasks.fold(
          (failure) => emit(TaskError(message: _mapFailureToMessage(failure))),
          (tasks) => emit(TaskLoaded(tasks: tasks)));
    });

    on<UpdateTaskEvent>((event, emit) async {
      emit(TaskLoading());
      var failureOrTasks = await taskUseCases.updateTask(event.task);
      failureOrTasks.fold(
          (failure) => emit(TaskError(message: _mapFailureToMessage(failure))),
          (tasks) => emit(TaskLoaded(tasks: tasks)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
