import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/presentation/bloc/add_delete_update_bloc/add_delete_update_bloc.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdate;
  final Todo? todo;
  const FormWidget({super.key, required this.isUpdate, this.todo});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _todoController = TextEditingController();
  final TextEditingController _completedController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      _todoController.text = widget.todo!.todo;
      _completedController.text = widget.todo!.completed.toString();
    }
    super.initState();
  }

  void validateFormThenUpdateOrAddTodo() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final todo = Todo(
        id: widget.isUpdate ? widget.todo!.id : null,
        todo: _todoController.text,
        completed: true,
      );
      if (widget.isUpdate) {
        BlocProvider.of<AddDeleteUpdateBlocBloc>(
          context,
        ).add(UpdateTodoEvent(todo: todo));
      } else {
        BlocProvider.of<AddDeleteUpdateBlocBloc>(
          context,
        ).add(AddTodoEvent(todo: todo));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: _todoController,
              decoration: InputDecoration(labelText: 'Todo', hintText: 'Todo'),
              validator:
                  (value) => value!.isEmpty ? 'Please enter a todo' : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: _completedController,
              decoration: InputDecoration(
                labelText: 'Completed',
                hintText: 'Completed',
              ),
              minLines: 6,
              maxLines: 6,
              validator:
                  (value) => value!.isEmpty ? 'Please enter a todo' : null,
            ),
          ),

          ElevatedButton.icon(
            onPressed: validateFormThenUpdateOrAddTodo,
            icon:
                widget.isUpdate
                    ? Icon(Icons.edit, color: Colors.white)
                    : Icon(Icons.add, color: Colors.white),
            label: Text(widget.isUpdate ? "Update" : "Add"),
          ),
        ],
      ),
    );
  }
}
