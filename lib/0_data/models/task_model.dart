import 'package:equatable/equatable.dart';
import 'package:todoey/1_domain/entities/task_entity.dart';

class TaskModel extends TaskEntity with EquatableMixin {
  TaskModel({required super.name, required super.isDone});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(name: json['name'], isDone: json['isDone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromEntity(TaskEntity taskEntity) {
    return TaskModel(name: taskEntity.name, isDone: taskEntity.isDone);
  }
}
