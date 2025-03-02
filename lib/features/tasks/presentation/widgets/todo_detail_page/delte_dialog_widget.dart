import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/features/tasks/presentation/bloc/add_delete_update_bloc/add_delete_update_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final int todoId;
  const DeleteDialogWidget({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Deleting Todo"),
      content: Text("Are you sure you want to delete this todo?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AddDeleteUpdateBlocBloc>(
              context,
            ).add(DeleteTodoEvent(todoId: todoId));
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (_) => TodosPage()),
            // );
          },
          child: Text("Yes"),
        ),
      ],
    );
  }
}

class AddDeleteUpdateBloc {}
