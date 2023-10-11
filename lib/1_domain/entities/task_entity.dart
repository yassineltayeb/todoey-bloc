import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String name;
  bool isDone;

  TaskEntity({
    required this.name,
    required this.isDone,
  });

  @override
  List<Object?> get props => [
        name,
        isDone,
      ];
}
