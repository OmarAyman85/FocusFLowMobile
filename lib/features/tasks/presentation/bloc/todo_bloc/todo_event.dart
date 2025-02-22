part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodosEvent extends TodoEvent {}

class RefreshTodosEvent extends TodoEvent {}
