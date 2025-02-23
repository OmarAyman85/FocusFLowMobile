import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/core/utils/snackBars/snackbar_message.dart';
import 'package:focusflow/core/widgets/loading_widget.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/presentation/bloc/add_delete_update_bloc/add_delete_update_bloc.dart';
import 'package:focusflow/features/tasks/presentation/pages/todos_add_update_page.dart';
import 'package:focusflow/features/tasks/presentation/pages/todos_page.dart';
import 'package:focusflow/features/tasks/presentation/widgets/todo_detail_page/delte_dialog_widget.dart';

class TodoDetailWidget extends StatelessWidget {
  final Todo todo;
  const TodoDetailWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            todo.todo,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Divider(thickness: 2),
          Text(
            "Completed: ${todo.completed}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          Divider(thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => TodosAddUpdatePage(isUpdate: true, todo: todo),
                    ),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.white),
                label: Text("Edit"),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () => deleteDialog(context),
                icon: Icon(Icons.delete, color: Colors.white),
                label: Text("Delete"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void deleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocConsumer<AddDeleteUpdateBlocBloc, AddDeleteUpdateBlocState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdateBlocState) {
              SnackbarMessage().showSucessSnackBar(
                message: state.message,
                context: context,
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => TodosPage()),
                (route) => false,
              );
            } else if (state is ErrorAddDeleteUpdateBlocState) {
              Navigator.of(context).pop();
              SnackbarMessage().showErrorSnackBar(
                message: state.message,
                context: context,
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdateBlocState) {
              return AlertDialog(
                title: SizedBox(
                  height: 300,
                  width: 300,
                  child: LoadingWidget(),
                ),
              );
            }
            return DeleteDialogWidget(todoId: todo.id!);
          },
        );
      },
    );
  }
}
