import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/core/widgets/loading_widget.dart';
import 'package:focusflow/features/tasks/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:focusflow/features/tasks/presentation/pages/todos_add_update_page.dart';
import 'package:focusflow/features/tasks/presentation/widgets/todos_page/message_diplay_widget.dart';
import 'package:focusflow/features/tasks/presentation/widgets/todos_page/todo_list_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      body: _bodyBuild(),
      floatingActionButton: _floatingActionButtonBuild(context),
    );
  }

  AppBar _appBarBuild() => AppBar(title: Text('Todos'), centerTitle: true);

  Widget _bodyBuild() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is LoadingTodosState) {
            return LoadingWidget();
          } else if (state is LoadedTodosState) {
            return TodoListWidget(todos: state.todos);
          } else if (state is ErrorTodosState) {
            return MessageDiplayWidget(message: state.message);
          } else {
            return Text("Unexpected state");
          }
        },
      ),
    );
  }

  Widget _floatingActionButtonBuild(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TodosAddUpdatePage(isUpdate: false),
          ),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
