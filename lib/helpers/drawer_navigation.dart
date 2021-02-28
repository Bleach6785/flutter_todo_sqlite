import 'package:flutter/material.dart';
import 'package:flutter_todo_sqlite/screens/categories_screen.dart';
import 'package:flutter_todo_sqlite/screens/home_screen.dart';
import 'package:flutter_todo_sqlite/services/category_service.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  List<Widget> _categoryList = List<Widget>();

  CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.readCategories();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(ListTile(
          title: Text(category['name']),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pic.pimg.tw/hanzhiyu/1605433233-1520719975-g_m.jpg'),
              ),
              accountName: Text('User Name'),
              accountEmail: Text('xxxx@xxx.xxx'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Categories'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              ),
            ),
            Divider(),
            Column(
              children: _categoryList,
            ),
          ],
        ),
      ),
    );
  }
}
