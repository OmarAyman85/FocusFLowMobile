import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/core/widgets/loading_widget.dart';
import 'package:focusflow/features/tasks/presentation/bloc/todo_bloc/todo_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBarBuild(), body: _bodyBuild());
  }

  AppBar _appBarBuild() => AppBar(title: Text('Todos'));

  Widget _bodyBuild() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is LoadedTodosState) {
            return LoadingWidget();
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}
