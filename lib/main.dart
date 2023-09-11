import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meal_app/1.1%20dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categoriesScreen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/fitters_screen.dart';
import 'package:meal_app/screens/meal_detial_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
Map<String,bool > _filters ={
  'gluten':false,
  'lotose':false,
  'vengan':false,
  'vegetarian':false,


};
List<Meal> _availableMeals=DUMMY_MEALS;
List<Meal> _favortieMeals=[];

void setFilters (Map<String,bool > _fiterData)
{
  setState(() {
    _filters=_fiterData;
    _availableMeals=DUMMY_MEALS.where((meal) {
      if(_filters['gluten']==true && meal.isGlutenFree==false)
      {
        return false;
      }
      if(_filters['lotose']==true && meal.isLactoseFree==false)
      {
        return false;
      }
      if(_filters['vengan']==true && meal.isVegan==false)
      {
        return false;
      }
      if(_filters['vegetarian']==true && meal.isVegetarian==false)
      {
        return false;
      }
      return true ;
    }).toList();
  });

}

void _toggleFavorite(String mealId)
{
 final existingIndex= _favortieMeals.indexWhere((meal) => meal.id==mealId);

 if(existingIndex >= 0)
 {
  setState(() {
    _favortieMeals.removeAt(existingIndex);
  });
 }
 else {
  setState(() {
    _favortieMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
  });
 }



}

bool _isMealFavorite(String id)
{
  return _favortieMeals.any((meal) => meal.id==id);

}
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.pink,
         hintColor:Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1:TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          bodyText2:TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
          subtitle1:TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (context)=>TabsScreen(_favortieMeals),
        CategoryMealScreen.routName:(context) => CategoryMealScreen(_availableMeals),
        MealDetialScreen.routName:(context) => MealDetialScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName:(context) => FilterScreen(setFilters,_filters)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
