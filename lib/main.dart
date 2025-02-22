import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => TodoBloc(
                getAllTodos: GetAllTodosUseCase(
                  TodosRepositoryImpl(
                    remoteDataSource: TodoRemoteDataSourceImp(),
                    localDataSource: TodoLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences,
                    ),
                    networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.createInstance(),
                    ),
                  ),
                ),
              ),
        ),
        BlocProvider(
          create:
              (_) => AddDeleteUpdateBlocBloc(
                addTodo: AddTodosUseCase(
                  TodosRepositoryImpl(
                    remoteDataSource: TodoRemoteDataSourceImp(),
                    localDataSource: TodoLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences,
                    ),
                    networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.createInstance(),
                    ),
                  ),
                ),

                updateTodo: UpdateTodosUseCase(
                  TodosRepositoryImpl(
                    remoteDataSource: TodoRemoteDataSourceImp(),
                    localDataSource: TodoLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences,
                    ),
                    networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.createInstance(),
                    ),
                  ),
                ),

                deleteTodo: DeleteTodosUseCase(
                  TodosRepositoryImpl(
                    remoteDataSource: TodoRemoteDataSourceImp(),
                    localDataSource: TodoLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences,
                    ),
                    networkInfo: NetworkInfoImpl(
                      InternetConnectionChecker.createInstance(),
                    ),
                  ),
                ),
              ),
        ),
      ],
      child: MaterialApp(
        title: 'Focus FLow',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Focus FLow'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
