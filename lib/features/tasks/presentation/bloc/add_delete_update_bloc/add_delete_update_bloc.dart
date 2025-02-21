import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/core/utils/strings/failures.dart';
import 'package:focusflow/core/utils/strings/messages.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/domain/usecases/add_todos.dart';
import 'package:focusflow/features/tasks/domain/usecases/delete_dotos.dart';
import 'package:focusflow/features/tasks/domain/usecases/update_todos.dart';

part 'add_delete_update_event.dart';
part 'add_delete_update_state.dart';

class AddDeleteUpdateBlocBloc
    extends Bloc<AddDeleteUpdateBlocEvent, AddDeleteUpdateBlocState> {
  final AddTodosUseCase addTodo;
  final UpdateTodosUseCase updateTodo;
  final DeleteTodosUseCase deleteTodo;

  AddDeleteUpdateBlocBloc({
    required this.addTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(AddDeleteUpdateBlocInitial()) {
    on<AddDeleteUpdateBlocEvent>((event, emit) async {
      if (event is AddTodoEvent) {
        emit(LoadingAddDeleteUpdateBlocState());
        final failureOrDoneMessage = await addTodo(event.todo);
        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            ADD_SUCCESS_MESSAGE,
          ),
        );
      } else if (event is UpdateTodoEvent) {
        emit(LoadingAddDeleteUpdateBlocState());
        final failureOrDoneMessage = await updateTodo(event.todo);
        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            UPDATE_SUCCESS_MESSAGE,
          ),
        );
      } else if (event is DeleteTodoEvent) {
        emit(LoadingAddDeleteUpdateBlocState());
        final failureOrDoneMessage = await deleteTodo(event.todoId);
        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            DELETE_SUCCESS_MESSAGE,
          ),
        );
      }
    });
  }

  AddDeleteUpdateBlocState _eitherDoneMessageOrErrorState(
    Either<Failure, Unit> either,
    String message,
  ) {
    return either.fold(
      (failure) =>
          ErrorAddDeleteUpdateBlocState(message: _mapFailureToMessage(failure)),
      (_) => MessageAddDeleteUpdateBlocState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later ...";
    }
  }
}
