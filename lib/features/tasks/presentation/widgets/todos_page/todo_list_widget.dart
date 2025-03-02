import 'package:flutter/material.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/presentation/pages/todo_detail_page.dart';

class TodoListWidget extends StatelessWidget {
  final List<Todo> todos;
  const TodoListWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(todos[index].id.toString()),
          title: Text(
            todos[index].todo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            todos[index].completed.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TodoDetailPage(todo: todos[index]),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 2),
    );
  }
}
