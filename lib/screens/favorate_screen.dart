import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_items.dart';

class FavorateScreen extends StatelessWidget {
   final List<Meal> favorateMeals;


  const FavorateScreen(this.favorateMeals);

  @override
  Widget build(BuildContext context) {

  if(favorateMeals.isEmpty)
  {
    return Center(
      child: Text("You have no favorites ye start adding some "),

    );

  }else
  {
    return  ListView.builder(
        itemBuilder:(ctx,index){
       return MealItem(
        id:favorateMeals[index].id ,
        imageUrl: favorateMeals[index].imageUrl,
        title: favorateMeals[index].title,
        duration: favorateMeals[index].duration,
        complexity: favorateMeals[index].complexity,
        affordability: favorateMeals[index].affordability,
      
       );
        } ,
        itemCount:favorateMeals.length ,

      );

  }

    return Scaffold(
           appBar: AppBar(
            title: Text("foavorateScreen "),
           ),
    );
  }
}