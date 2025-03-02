import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/core/utils/snackBars/snackbar_message.dart';
import 'package:focusflow/core/widgets/loading_widget.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/presentation/bloc/add_delete_update_bloc/add_delete_update_bloc.dart';
import 'package:focusflow/features/tasks/presentation/pages/todos_page.dart';
import 'package:focusflow/features/tasks/presentation/widgets/add_update_todo_page/form_widget.dart';

class TodosAddUpdatePage extends StatelessWidget {
  final Todo? todo;
  final bool isUpdate;
  const TodosAddUpdatePage({super.key, this.todo, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(isUpdate ? 'Update Todo' : 'Add Todo'),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BlocConsumer<AddDeleteUpdateBlocBloc, AddDeleteUpdateBlocState>(
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
              SnackbarMessage().showErrorSnackBar(
                message: state.message,
                context: context,
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdateBlocState) {
              return LoadingWidget();
            }
            return FormWidget(isUpdate: isUpdate, todo: isUpdate ? todo : null);
          },
        ),
      ),
    );
  }
}
