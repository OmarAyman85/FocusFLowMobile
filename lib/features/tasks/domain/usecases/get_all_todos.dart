import 'package:dartz/dartz.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/domain/repositories/todos_repository.dart';

class GetAllTodosUseCase {
  final TodosRepository repository;

  GetAllTodosUseCase(this.repository);

  Future<Either<Failure, List<Todo>>> call() async {
    return await repository.getAllTodos();
  }
}
