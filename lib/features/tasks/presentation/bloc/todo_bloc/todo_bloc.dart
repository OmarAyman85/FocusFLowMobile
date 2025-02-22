import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/core/utils/strings/failures.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/domain/usecases/get_all_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetAllTodosUseCase getAllTodos;

  TodoBloc({required this.getAllTodos}) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is GetAllTodosEvent) {
        emit(LoadingTodosState());
        final failureOrTasks = await getAllTodos();
        emit(_mapFailureOrTodosToState(failureOrTasks));
      } else if (event is RefreshTodosEvent) {
        emit(LoadingTodosState());
        final failureOrTasks = await getAllTodos();
        emit(_mapFailureOrTodosToState(failureOrTasks));
      }
    });
  }

  TodoState _mapFailureOrTodosToState(Either<Failure, List<Todo>> either) {
    return either.fold(
      (failure) => ErrorTodosState(message: _mapFailureToMessage(failure)),
      (todos) => LoadedTodosState(todos: todos),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure _:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later...";
    }
  }
}
