import 'package:focusflow/features/tasks/domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel({super.id, required super.todo, required super.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"],
      todo: json["todo"],
      completed: json["completed"],
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, "todo": todo, "completed": completed};
  }
}
