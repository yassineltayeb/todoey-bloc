import 'package:dartz/dartz.dart';
import 'package:todoey/1_domain/failures/failures.dart';

import '../entities/task_entity.dart';
import '../repositories/task_repo.dart';

class TaskUseCases {
  final TaskRepo taskRepo;

  TaskUseCases({required this.taskRepo});

  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    return await taskRepo.getTasksFromDataSource();
  }

  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task) async {
    return await taskRepo.addTaskToDataSource(task);
  }

  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task) async {
    task.isDone = !task.isDone;
    return await taskRepo.updateTaskToDataSource(task);
  }

  Future<Either<Failure, TaskEntity>> deleteTask(TaskEntity task) async {
    return await taskRepo.deleteTaskFromDataSource(task);
  }
}
