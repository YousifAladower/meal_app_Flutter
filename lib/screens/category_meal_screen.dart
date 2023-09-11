import 'package:flutter/material.dart';
import 'package:meal_app/1.1%20dummy_data.dart';
import 'package:meal_app/widgets/meal_items.dart';

import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
 
final List<Meal> availableMeals;
 const CategoryMealScreen(this.availableMeals);

static const routName='category_meals';
  @override
  State<CategoryMealScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> dispyedMeal; 

void _removeItem(String mealId)
{
  setState(() {
    dispyedMeal.removeWhere((meal) => meal.id==mealId);
  });

}

void didChangeDependencies()
{
     final routag=ModalRoute.of(context)?.settings.arguments as Map<String ,String>;
    final categoryId=routag['id'];
     categoryTitle=routag['title'].toString();
    dispyedMeal = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
  super.didChangeDependencies();
}

void initState()
{
   
    super.initState();
}

  @override
   
  Widget build(BuildContext context) {


        return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder:(ctx,index){
       return MealItem(
        id:dispyedMeal[index].id ,
        imageUrl: dispyedMeal[index].imageUrl,
        title: dispyedMeal[index].title,
        duration: dispyedMeal[index].duration,
        complexity: dispyedMeal[index].complexity,
        affordability: dispyedMeal[index].affordability,
     
       );
        } ,
        itemCount:dispyedMeal.length ,

      ),
    );
  }
}