import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';

class CategorItems extends StatelessWidget
{
    final String id;
  final String title;
  final Color color; 
  CategorItems(this.id,this.title,this.color);

void selectCategory(BuildContext ctx)
{
  print(CategoryMealScreen.routName);
  Navigator.of(ctx).pushNamed(
    CategoryMealScreen.routName,
    arguments: {
      'id':id,
      'title':title
    }
  
  );
}

  @override
  Widget build(BuildContext context) {
   return InkWell(
    onTap: ()=>selectCategory(context),
    splashColor: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(15),
    child: Container(
      padding: EdgeInsets.all(15),
      child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            color.withOpacity(0.7),
            color 
          ] ,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight        ),
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
    ),
   );
  }

}