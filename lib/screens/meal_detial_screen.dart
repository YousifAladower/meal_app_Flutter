import 'package:flutter/material.dart';
import 'package:meal_app/1.1%20dummy_data.dart';
import 'package:meal_app/widgets/meal_items.dart';

class MealDetialScreen extends StatelessWidget {
  const MealDetialScreen({super.key});

static const routName="mealDetialscreen";
Widget buildSelectionTitle(BuildContext context ,String text)
{
   return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(text,style: Theme.of(context).textTheme.subtitle1,),
        );

}

Widget builContainer(Widget _child)
{
 return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)

           ),
           margin: EdgeInsets.all(10),
           padding: EdgeInsets.all(10),
          height: 150,
          width: 300,
          child: _child
        );
}

  @override
  Widget build(BuildContext context) {
    final maelId=ModalRoute.of(context)?.settings.arguments as String;
   final selectedMeal=DUMMY_MEALS.firstWhere((meal)=>meal.id==maelId);

    return Scaffold(
      appBar: AppBar(
        title: Text(maelId),
        
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
          ),
        
                 buildSelectionTitle(context,"Ingredient"),
        builContainer(ListView.builder(
              itemBuilder: (ctx,index)=> Card(
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0 ,horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
              itemCount:selectedMeal.ingredients.length ,
              ),),
      
          buildSelectionTitle(context, "Steps"),
          builContainer(ListView.builder(
              itemBuilder: (ctx,index)=>Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("#${index+1}"),
                    ),
                    title: Text(selectedMeal.steps[index],style: TextStyle(fontSize: 15),),
                  ),
                  //Divider(),
                ],
              ),
              itemCount:selectedMeal.steps.length ,
              ),),
        ]),
      ) ,
    );
  }
}