import 'package:flutter_todo_sqlite/models/todo.dart';
import 'package:flutter_todo_sqlite/repositories/repository.dart';

class TodoService {
  Repository _repository;

  TodoService() {
    _repository = Repository();
  }

  saveTodo(Todo todo) async {
    return await _repository.insertData('todos', todo.todoMap());
  }
}
