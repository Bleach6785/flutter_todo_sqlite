import 'package:flutter_todo_sqlite/models/category.dart';

class CategoryService {
  saveCategory(Category category) {
    print(category.name);
    print(category.description);
  }
}
