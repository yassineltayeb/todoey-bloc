import 'package:dartz/dartz.dart';
import 'package:todoey/1_domain/entities/task_entity.dart';
import 'package:todoey/1_domain/failures/failures.dart';

abstract class TaskRepo {
  Future<Either<Failure, List<TaskEntity>>> getTasksFromDataSource();
  Future<Either<Failure, List<TaskEntity>>> addTaskToDataSource(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> updateTaskToDataSource(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> deleteTaskFromDataSource(TaskEntity task);
}
