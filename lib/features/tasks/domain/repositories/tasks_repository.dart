import 'package:dartz/dartz.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<Todo>>> getAllTasks();
  Future<Either<Failure, Unit>> addTasks();
  Future<Either<Failure, Unit>> updateTasks();
  Future<Either<Failure, Unit>> deleteTasks();
}
