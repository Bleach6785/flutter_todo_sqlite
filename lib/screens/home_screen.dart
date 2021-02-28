import 'package:flutter/material.dart';
import 'package:flutter_todo_sqlite/helpers/drawer_navigation.dart';
import 'package:flutter_todo_sqlite/models/todo.dart';
import 'package:flutter_todo_sqlite/screens/todo_screen.dart';
import 'package:flutter_todo_sqlite/services/todo_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoService _todoService;

  List<Todo> _todoList = List<Todo>();

  @override
  void initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService = TodoService();
    _todoList = List<Todo>();

    var todos = await _todoService.readTodo();
    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoDate = todo['todoDate'];
        model.isFinished = todo['isFinished'];

        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist Sqlite'),
      ),
      drawer: DrawerNavigation(),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_todoList[index].title ?? "No Title"),
                  ],
                ),
                subtitle: Text(_todoList[index].category ?? "No Category"),
                trailing: Text(_todoList[index].todoDate ?? "No Date"),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoScreen(),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
