import 'package:flutter_todo_sqlite/models/category.dart';
import 'package:flutter_todo_sqlite/repositories/repository.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  // 新增資料
  saveCategory(Category category) async {
    // print(category.name);
    // print(category.description);
    return await _repository.insertData('categories', category.categoryMap());
  }

  // 從表格讀取資料
  readCategories() async {
    return await _repository.readData('categories');
  }

  // 使用Id從表格讀取資料
  readCategoryById(int categoryId) async {
    return await _repository.readDataById('categories',categoryId);
  }
}
