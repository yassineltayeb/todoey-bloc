import 'package:get_it/get_it.dart';
import 'package:todoey/0_data/datasources/task_local_datasource.dart';
import 'package:todoey/0_data/repositories/task_repo_impl.dart';
import 'package:todoey/1_domain/repositories/task_repo.dart';
import 'package:todoey/1_domain/usecases/task_usecases.dart';
import 'package:todoey/2_application/pages/task/bloc/task_bloc.dart';

// Service Locator
final sl = GetIt.I;

Future<void> init() async {
  // ! data layer
  sl.registerFactory<TaskRepo>(() => TaskRepoImpl(taskLocalDataSource: sl()));
  sl.registerFactory<TaskLocalDataSource>(() => TaskLocalDataSourceImpl());

// ! domain layer
  sl.registerFactory(() => TaskUseCases(taskRepo: sl()));

  // ! application layer
  sl.registerFactory(() => TaskBloc(taskUseCases: sl()));
}
