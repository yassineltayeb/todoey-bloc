import 'package:dartz/dartz.dart';
import 'package:todoey/0_data/datasources/task_local_datasource.dart';
import 'package:todoey/0_data/exceptions/exceptions.dart';
import 'package:todoey/0_data/models/task_model.dart';
import 'package:todoey/1_domain/entities/task_entity.dart';
import 'package:todoey/1_domain/failures/failures.dart';
import 'package:todoey/1_domain/repositories/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  final TaskLocalDataSource taskLocalDataSource;

  TaskRepoImpl({required this.taskLocalDataSource});

  @override
  Future<Either<Failure, TaskEntity>> addTaskToDataSource(
      TaskEntity task) async {
    try {
      final taskModel = TaskModel.fromEntity(task);
      final addedTask =
          await taskLocalDataSource.addTaskToLocalStorage(taskModel);
      return right(taskModel);
    } on ServerException catch (e) {
      return left(ServerFailure());
    } on CacheException catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTaskToDataSource(
      TaskEntity task) async {
    try {
      final taskModel = TaskModel.fromEntity(task);
      final updatedTask =
          await taskLocalDataSource.updateTaskToLocalStorage(taskModel);
      return right(taskModel);
    } on ServerException catch (e) {
      return left(ServerFailure());
    } on CacheException catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> deleteTaskFromDataSource(
      TaskEntity task) async {
    try {
      final taskModel = TaskModel.fromEntity(task);
      final addedTask =
          await taskLocalDataSource.deleteTaskFromLocalStorage(taskModel);
      return right(taskModel);
    } on ServerException catch (e) {
      return left(ServerFailure());
    } on CacheException catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasksFromDataSource() async {
    try {
      final tasks = await taskLocalDataSource.getTasksFromLocalStorage();
      return right(tasks);
    } on ServerException catch (e) {
      return left(ServerFailure());
    } on CacheException catch (e) {
      return left(CacheFailure());
    }
  }
}
