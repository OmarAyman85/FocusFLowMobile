import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:focusflow/core/errors/exceptions.dart';
import 'package:focusflow/features/tasks/data/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getCachedTodos();
  Future<Unit> cacheTodos(List<TodoModel> todoModels);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;
  TodoLocalDataSourceImpl({required this.sharedPreferences});
  //************************************************************************************** */
  @override
  Future<Unit> cacheTodos(List<TodoModel> todoModels) {
    List todoModelsToJson =
        todoModels
            .map<Map<String, dynamic>>((todoModel) => todoModel.toJson())
            .toList();
    sharedPreferences.setString("CACHED_TODOS", json.encode(todoModelsToJson));
    return Future.value(unit);
  }

  //************************************************************************************** */
  @override
  Future<List<TodoModel>> getCachedTodos() {
    final jsonString = sharedPreferences.getString("CACHED_TODOS");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<TodoModel> jsonToTodoModels =
          decodeJsonData
              .map<TodoModel>(
                (jsonTodoModel) => TodoModel.fromJson(jsonTodoModel),
              )
              .toList();
      return Future.value(jsonToTodoModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
