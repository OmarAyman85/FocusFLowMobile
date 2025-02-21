import 'package:dartz/dartz.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';

abstract class TodosRepository {
  Future<Either<Failure, List<Todo>>> getAllTodos();
  Future<Either<Failure, Unit>> addTodos();
  Future<Either<Failure, Unit>> updateTodos();
  Future<Either<Failure, Unit>> deleteTodos();
}
