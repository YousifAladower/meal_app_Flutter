import 'package:flutter/material.dart';
import 'package:meal_app/screens/categoriesScreen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/meal_detial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        '/': (context)=>CategoriesScreen(),
        CategoryMealScreen.routName:(context) => CategoryMealScreen(),
        MealDetialScreen.routName:(context) => MealDetialScreen()
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
