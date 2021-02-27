import 'package:flutter_todo_sqlite/models/category.dart';
import 'package:flutter_todo_sqlite/repositories/repository.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category category) async {
    // print(category.name);
    // print(category.description);
    return await _repository.insertData('categories', category.categoryMap());
  }
}
