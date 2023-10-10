// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  final String name;
  bool isDone;

  Task({
    required this.name,
    this.isDone = false,
  });

  toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      isDone: json['isDone'],
    );
  }
}
