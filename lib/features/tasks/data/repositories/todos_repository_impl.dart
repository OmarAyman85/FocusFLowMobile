import 'package:dartz/dartz.dart';
import 'package:focusflow/core/errors/exceptions.dart';
import 'package:focusflow/core/errors/failures.dart';
import 'package:focusflow/core/network/network_info.dart';
import 'package:focusflow/features/tasks/data/datasources/todo_local_data_source.dart';
import 'package:focusflow/features/tasks/data/datasources/todo_remote_data_source.dart';
import 'package:focusflow/features/tasks/data/models/todo_model.dart';
import 'package:focusflow/features/tasks/domain/entities/todo.dart';
import 'package:focusflow/features/tasks/domain/repositories/todos_repository.dart';

typedef DeleteOrUpdateOrAddTodo = Future<Unit> Function();

class TodosRepositoryImpl implements TodosRepository {
  final TodoRemoteDataSource remoteDataSource;
  final TodoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TodosRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Todo>>> getAllTodos() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTodos = await remoteDataSource.getAllTodos();
        localDataSource.cacheTodos(remoteTodos);
        return Right(remoteTodos);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTodos = await localDataSource.getCachedTodos();
        return Right(localTodos);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addTodos(Todo todo) async {
    final TodoModel todoModel = TodoModel(
      todo: todo.todo,
      completed: todo.completed,
    );
    return await _getMessage(() {
      return remoteDataSource.addTodos(todoModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateTodos(Todo todo) async {
    final TodoModel todoModel = TodoModel(
      todo: todo.todo,
      completed: todo.completed,
    );
    return await _getMessage(() {
      return remoteDataSource.updateTodos(todoModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteTodos(int todoId) async {
    return await _getMessage(() {
      return remoteDataSource.deleteTodos(todoId);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
    DeleteOrUpdateOrAddTodo deleteOrUpdateOrAddTodo,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddTodo();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
