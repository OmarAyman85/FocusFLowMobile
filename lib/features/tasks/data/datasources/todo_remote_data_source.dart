import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:focusflow/core/errors/exceptions.dart';
import 'package:focusflow/features/tasks/data/models/todo_model.dart';
// import 'package:http/http.dart' as http;

const baseUrl = "https://dummyjson.com/todos";

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getAllTodos();
  Future<Unit> addTodos(TodoModel todoModel);
  Future<Unit> updateTodos(TodoModel todoModel);
  Future<Unit> deleteTodos(int todoId);
}

//********************************************************************** */
//******************DIO IMPLEMENTATION********************************** */
//********************************************************************** */
class TodoRemoteDataSourceImp implements TodoRemoteDataSource {
  final Dio _dio = Dio();
  //******************FETCHING TODOS************************************** */
  @override
  Future<List<TodoModel>> getAllTodos() async {
    final response = await _dio.get(baseUrl);
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.data["todos"]) as List;
      final List<TodoModel> todoModels =
          decodedJson
              .map<TodoModel>(
                (jsonTodoModel) => TodoModel.fromJson(jsonTodoModel),
              )
              .toList();
      return todoModels;
    } else {
      throw ServerException();
    }
  }

  //******************ADDING TODOS************************************** */
  @override
  Future<Unit> addTodos(TodoModel todoModel) async {
    final response = await _dio.post(
      "$baseUrl/todos/add",
      data: {
        "id": todoModel.id,
        'todo': todoModel.todo,
        'completed': todoModel.completed,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer YOUR_TOKEN',
          // 'Custom-Header': 'CustomValue',
        },
      ),
    );

    if (response.statusCode == 200) {
      // Changed to 200, as DummyJSON API returns 200, not 201
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  //******************UPDATING TODOS************************************** */
  @override
  Future<Unit> updateTodos(TodoModel todoModel) async {
    final todoId = todoModel.id.toString();
    final response = await _dio.put(
      '$baseUrl/todos/$todoId',
      data: {"todo": todoModel.todo, "completed": todoModel.completed},
      options: Options(
        headers: {
          'Content-Type': "application/json",
          // 'Authorization': 'Bearer YOUR_TOKEN',
        },
      ),
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  //******************DELETEING TODOS************************************** */
  @override
  Future<Unit> deleteTodos(int todoId) async {
    final response = await _dio.delete(
      '$baseUrl/todos/$todoId',
      options: Options(
        headers: {
          'Content-type': 'application/json',
          // 'Authorization': 'Bearer YOUR_TOKEN',
        },
      ),
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}

//********************************************************************** */
//*****************HTTP IMPLEMENTATION********************************** */
//********************************************************************** */
// class TodoRemoteDataSourceHttpImp implements TodoRemoteDataSource {
//   //******************FETCHING TODOS************************************** */
//   @override
//   Future<List<TodoModel>> getAllTodos() async {
//     final response = await http.get(Uri.parse(baseUrl));

//     if (response.statusCode == 200) {
//       // Decode the raw JSON string to a Map
//       final Map<String, dynamic> jsonData = json.decode(response.body);

//       // Accessing the 'todos' array inside the JSON
//       final List decodedJson = jsonData['todos'] as List;

//       // Mapping the JSON to a list of TodoModel objects
//       final List<TodoModel> todoModels =
//           decodedJson
//               .map<TodoModel>(
//                 (jsonTodoModel) => TodoModel.fromJson(jsonTodoModel),
//               )
//               .toList();

//       return todoModels;
//     } else {
//       throw ServerException();
//     }
//   }

//   //******************ADDING TODOS************************************** */
//   @override
//   Future<Unit> addTodos(TodoModel todoModel) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/todos/add'),
//       headers: {
//         'Content-Type': 'application/json',
//         // 'Authorization': 'Bearer YOUR_TOKEN',
//         // 'Custom-Header': 'CustomValue',
//       },
//       body: json.encode({
//         'id': todoModel.id,
//         'todo': todoModel.todo,
//         'completed': todoModel.completed,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return Future.value(unit);
//     } else {
//       throw ServerException();
//     }
//   }

//   //******************UPDATING TODOS************************************** */
//   @override
//   Future<Unit> updateTodos(TodoModel todoModel) async {
//     final todoId = todoModel.id.toString();
//     final body = json.encode({
//       "todo": todoModel.todo,
//       "completed": todoModel.completed,
//     });
//     final response = await http.put(
//       Uri.parse('$baseUrl/todos/$todoId'),
//       headers: {
//         "Content-Type": "application/json",
//         // 'Authorization': 'Bearer YOUR_TOKEN',
//       },
//       body: body,
//     );
//     if (response.statusCode == 200) {
//       return Future.value(unit);
//     } else {
//       throw ServerException();
//     }
//   }

//   //******************DELETEING TODOS************************************** */
//   @override
//   Future<Unit> deleteTodos(int todoId) async {
//     final response = await http.delete(
//       Uri.parse('$baseUrl/todos/$todoId'),
//       headers: {
//         'Content-Type': 'application/json',
//         // 'Authorization': 'Bearer YOUR_TOKEN',
//       },
//     );
//     if (response.statusCode == 200) {
//       return Future.value(unit);
//     } else {
//       throw ServerException();
//     }
//   }
// }
