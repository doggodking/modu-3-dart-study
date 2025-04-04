import '../../2025-04-01/model/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(int id);
}
