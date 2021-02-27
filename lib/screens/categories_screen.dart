import 'package:flutter/material.dart';
import 'package:flutter_todo_sqlite/models/category.dart';
import 'package:flutter_todo_sqlite/screens/home_screen.dart';
import 'package:flutter_todo_sqlite/services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  _showFormDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: [
            FlatButton(
              color: Colors.red,
              onPressed: () => Navigator.pop(context),
              child: Text('Canel'),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                // print('Category: ${_categoryNameController.text}');
                // print('Description: ${_categoryDescriptionController.text}');
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;

                _categoryService.saveCategory(_category);
              },
              child: Text('Save'),
            ),
          ],
          title: Text('Categories Form'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                    hintText: 'Write a category',
                    labelText: 'Category',
                  ),
                ),
                TextField(
                  controller: _categoryDescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Write a description',
                    labelText: 'Description',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: RaisedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.blue,
          elevation: 0.0, // 去除陰影
        ),
      ),
      body: Center(
        child: Text('Welcome to Categories Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
