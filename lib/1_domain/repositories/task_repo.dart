import 'package:dartz/dartz.dart';
import 'package:todoey/1_domain/entities/task_entity.dart';
import 'package:todoey/1_domain/failures/failures.dart';

abstract class TaskRepo {
  Future<Either<Failure, List<TaskEntity>>> getTasksFromDataSource();
  Future<Either<Failure, TaskEntity>> addTaskToDataSource(TaskEntity task);
  Future<Either<Failure, TaskEntity>> deleteTaskFromDataSource(TaskEntity task);
}
