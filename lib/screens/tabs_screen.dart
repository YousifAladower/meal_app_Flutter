import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/categoriesScreen.dart';
import 'package:meal_app/screens/favorate_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TabsScreen> {
final List<Map< String,Object>> _pages =[
  {
    'page':CategoriesScreen(),
    'name':'CATEGORIES',
  },
  {
    'page':FavorateScreen(),
    'name':'FAVORATE',
  }

];

int _selectPageIndex=0;
  void _selectPage(int value) {
    setState(() {
      _selectPageIndex=value;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['name'].toString()),
      ),
      body:_pages[_selectPageIndex]['page'] as Widget,
      bottomNavigationBar:BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            label:"Categories",),
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            label:"favorites",)

        ],
      ) ,
    );
  }

  
}