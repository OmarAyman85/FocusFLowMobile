import 'package:dartz/dartz.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/features/tasks/domain/repositories/todos_repository.dart';

class AddTodosUseCase {
  final TodosRepository repository;

  AddTodosUseCase(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.addTodos();
  }
}
