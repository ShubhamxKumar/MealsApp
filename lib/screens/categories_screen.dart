import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:Meals/dummyDataBase.dart';
import 'package:Meals/widgets/categoryTile.dart';

class CategoriesScreen extends StatelessWidget {
  final Map<String, bool> filteredChoice;
  CategoriesScreen({this.filteredChoice = const {
    'glutenFree' : false,
    'lactoseFree' : false,
    'isVegan' : false,
    'isVegetarian' : false,
  }});
  @override
  Widget build(BuildContext context) {
    List<MealModel> availableMeals = DUMMY_MealModelS.where((element) {
        if(filteredChoice['glutenFree'] && !element.isGlutenFree ){
          return false;
        }
        if(filteredChoice['lactoseFree'] && !element.isLactoseFree){
          return false;
        }
        if(filteredChoice['isVegan'] && !element.isVegan ){
          return false;
        }
        if(filteredChoice['isVegetarian'] && !element.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    return GridView(
      padding: EdgeInsets.all(15),
      children: CategoriesList.map((cat) {
        return CategoryTile(
          title: cat.title,
          color: cat.color,
          id: cat.id,
          availList: availableMeals,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // its a preconfigured class that tells the tiles to take the max width provided
        maxCrossAxisExtent:
            200, // the width taken by a single column, if the screen size is 300px, then only one column will be rendered, much like a listView.
        childAspectRatio: 3 /
            2, // the tiles created with the cross section of rows and columns will have width:height ratio as 3:2
        mainAxisSpacing: 20,
        crossAxisSpacing:
            20, //these two describe the amount of spacing between the rows and columns.
      ),
    );
  }
}
