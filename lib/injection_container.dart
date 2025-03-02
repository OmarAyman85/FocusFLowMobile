import 'package:focusflow/core/network/network_info.dart';
import 'package:focusflow/features/tasks/data/datasources/todo_local_data_source.dart';
import 'package:focusflow/features/tasks/data/datasources/todo_remote_data_source.dart';
import 'package:focusflow/features/tasks/data/repositories/todos_repository_impl.dart';
import 'package:focusflow/features/tasks/domain/usecases/add_todos.dart';
import 'package:focusflow/features/tasks/domain/usecases/delete_dotos.dart';
import 'package:focusflow/features/tasks/domain/usecases/get_all_todos.dart';
import 'package:focusflow/features/tasks/domain/usecases/update_todos.dart';
import 'package:focusflow/features/tasks/presentation/bloc/add_delete_update_bloc/add_delete_update_bloc.dart';
import 'package:focusflow/features/tasks/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusflow/features/tasks/domain/repositories/todos_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - tasks

  //Bloc
  sl.registerFactory(() => TodoBloc(getAllTodos: sl()));
  sl.registerFactory(
    () => AddDeleteUpdateBlocBloc(
      addTodo: sl(),
      updateTodo: sl(),
      deleteTodo: sl(),
    ),
  );

  //UseCases
  sl.registerLazySingleton(() => GetAllTodosUseCase(sl()));
  sl.registerLazySingleton(() => AddTodosUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTodosUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTodosUseCase(sl()));

  //Repository
  sl.registerLazySingleton<TodosRepository>(
    () => TodosRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Datasources
  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImp(),
  );
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Features - auth

  //Bloc

  //UseCases

  //Repository

  //Datasources

  //!Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //!External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
