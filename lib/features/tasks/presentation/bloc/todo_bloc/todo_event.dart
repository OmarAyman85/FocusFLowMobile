part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetAllTasksEvent extends TodoEvent {}

class RefreshTasksEvent extends TodoEvent {}
