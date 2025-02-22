import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/core/utils/theme/dark_theme.dart';
import 'package:focusflow/core/utils/theme/light_theme.dart';
import 'package:focusflow/features/tasks/presentation/bloc/add_delete_update_bloc/add_delete_update_bloc.dart';
import 'package:focusflow/features/tasks/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:focusflow/features/tasks/presentation/pages/todos_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<TodoBloc>()..add(GetAllTodosEvent())),
        BlocProvider(create: (_) => di.sl<AddDeleteUpdateBlocBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Focus FLow',
        theme: getLightTheme(),
        home: TodosPage(),
      ),
    );
  }
}
