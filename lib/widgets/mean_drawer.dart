import 'package:flutter/material.dart';
import 'package:meal_app/screens/fitters_screen.dart';

class MeanDrawer extends StatelessWidget {
  const MeanDrawer({super.key});

  Widget buildListTile (String title,IconData icon,VoidCallback  tapHander){
   return ListTile(
    leading: Icon(icon, size: 26),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.w900,
      ),
    ),
    onTap: tapHander,
  );

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
           color: Theme.of(context).backgroundColor,
           alignment: Alignment.centerLeft,
          child: Text("Cooking app",
                    style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor),
                    
                    ),
          
        ),
        const SizedBox(height: 20,),
       buildListTile("meal",Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
      buildListTile("fillters",Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);})
      ]),
    );
  }
}