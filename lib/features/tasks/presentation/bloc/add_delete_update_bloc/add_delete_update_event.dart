part of 'add_delete_update_bloc.dart';

sealed class AddDeleteUpdateBlocEvent extends Equatable {
  const AddDeleteUpdateBlocEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends AddDeleteUpdateBlocEvent {
  final Todo todo;

  const AddTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends AddDeleteUpdateBlocEvent {
  final Todo todo;

  const UpdateTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvent extends AddDeleteUpdateBlocEvent {
  final int todoId;

  const DeleteTodoEvent({required this.todoId});
  @override
  List<Object> get props => [todoId];
}
