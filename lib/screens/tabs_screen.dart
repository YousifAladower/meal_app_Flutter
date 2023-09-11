import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/categoriesScreen.dart';
import 'package:meal_app/screens/favorate_screen.dart';
import 'package:meal_app/widgets/mean_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
 final List<Meal> favorateMeals;

  const TabsScreen(this.favorateMeals);

  @override
  State<TabsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TabsScreen> {
 late List<Map< String,Object>> _pages ;

@override 
 void initState()
 {
  _pages=[
  {
    'page':CategoriesScreen(),
    'name':'CATEGORIES',
  },
  {
    'page':FavorateScreen(widget.favorateMeals),
    'name':'FAVORATE',
  }

];

  super.initState();
 }

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

          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectPageIndex,
          selectedFontSize: 15,
          unselectedFontSize: 10,
         // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            label:"Categories",),
          BottomNavigationBarItem(
            icon:Icon(Icons.star),
            label:"favorites",)

        ],
      ) ,


      drawer: MeanDrawer(),
    );
  }

  
}