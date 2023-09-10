import 'package:flutter/material.dart';
import 'package:meal_app/1.1%20dummy_data.dart';
import 'package:meal_app/widgets/meal_items.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({super.key});


static const routName='category_meals';
  @override
  State<CategoryMealScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {

    final routag=ModalRoute.of(context)?.settings.arguments as Map<String ,String>;
    final categoryId=routag['id'];
    final categoryTitle=routag['title'];
    final categoyMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
        return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder:(ctx,index){
       return MealItem(
        id:categoyMeals[index].id ,
        imageUrl: categoyMeals[index].imageUrl,
        title: categoyMeals[index].title,
        duration: categoyMeals[index].duration,
        complexity: categoyMeals[index].complexity,
        affordability: categoyMeals[index].affordability,
       );
        } ,
        itemCount:categoyMeals.length ,

      ),
    );
  }
}