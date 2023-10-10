import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String name;
  final bool isDone;

  const TaskEntity({
    required this.name,
    required this.isDone,
  });

  @override
  List<Object?> get props => [
        name,
        isDone,
      ];
}
