import 'package:flutter/material.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/presentation/widgets/todo_detail_page/todo_detail_page.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo todo;
  const TodoDetailPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text("Todo Detail"), centerTitle: true);
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TodoDetailWidget(todo: todo),
      ),
    );
  }
}
