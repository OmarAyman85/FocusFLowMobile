import 'package:dartz/dartz.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';

abstract class TodosRepository {
  Future<Either<Failure, List<Todo>>> getAllTodos();
  Future<Either<Failure, Unit>> addTodos(Todo todo);
  Future<Either<Failure, Unit>> updateTodos(Todo todo);
  Future<Either<Failure, Unit>> deleteTodos(int id);
}
