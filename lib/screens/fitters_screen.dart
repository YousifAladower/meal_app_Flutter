import 'package:flutter/material.dart';
import 'package:meal_app/widgets/mean_drawer.dart';

class FilterScreen extends StatefulWidget {
 
  static const routeName ='/filters';
  final Function saveFilter;
  final Map<String,bool> filters;
 FilterScreen(this.saveFilter,this.filters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _isGlutenFree=false;
   bool _isLactoseFree=false;
   bool _isVegan=false;
   bool _isVegetarian=false;

   @override
   void initState() {
    _isGlutenFree=widget.filters['gluten']!;
    _isLactoseFree=widget.filters['lotose']!;
    _isVegan=widget.filters['vengan']!;
   _isVegetarian=widget.filters['vegetarian']!;
    super.initState();
  }



   Widget buildswitchListTile(String title,String subtitle,bool currentVlaue,void Function(bool) updateValue)
   {
    print(currentVlaue);
    return SwitchListTile(
                  title: Text(title),
                  value: currentVlaue,
                  subtitle: Text(subtitle),
                   onChanged:updateValue,
                   );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtter"),
        actions: [
          IconButton(
            onPressed: (){
              final Map<String,bool >  selectFilters={
                
                      'gluten':_isGlutenFree,
                      'lotose':_isLactoseFree,
                      'vengan':_isVegan,
                      'vegetarian':_isVegetarian,

              };
              widget.saveFilter(selectFilters);
            }  ,
             icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection ",style:Theme.of(context).textTheme.subtitle1,),
          ),
          Expanded(
            child:ListView(
              children: [
              buildswitchListTile('Glute-free', 'Only include gluten-free meals',
               _isGlutenFree,(newValue){
                setState(() {
                  _isGlutenFree=newValue;
                });

              }),
               buildswitchListTile('Lactose-free',
                'Only include Lactose-free meals',
                 _isLactoseFree, (newValue){
                setState(() {
                  _isLactoseFree=newValue;
                });

              }),
               buildswitchListTile('vagetartain-free',
                'Only include vagetartain-free meals',
                 _isVegetarian, (newValue){
                setState(() {
                  _isVegetarian=newValue;
                });

              })
              , buildswitchListTile('Vegan-free',
               'Only include Vegan-free meals',
                _isVegan, (newValue){
                setState(() {
                  _isVegan=newValue;
                });

              })
              ],
            )
             )
        ],
      ),
      drawer: MeanDrawer(),
    );
  }
}