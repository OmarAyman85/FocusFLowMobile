part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class LoadingTodosState extends TodoState {}

final class LoadedTodosState extends TodoState {
  final List<Todo> todos;

  const LoadedTodosState({required this.todos});

  @override
  List<Object> get props => [todos];
}

final class ErrorTodosState extends TodoState {
  final String message;

  const ErrorTodosState({required this.message});

  @override
  List<Object> get props => [message];
}
