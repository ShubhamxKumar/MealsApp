import 'package:flutter/material.dart';
import 'package:Meals/dummyDataBase.dart';
import 'package:Meals/widgets/mealTile.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isNotEmpty
        ? ListView(
            children: favoriteMeals.map((meal) {
              return MealTile(
                title: meal.title,
                id: meal.id,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                affordability: meal.affordability,
                complexity: meal.complexity,
              );
            }).toList(),
          )
        : Center(
            child: Text('Looks Like you have no favorites, Try adding some!!!'),
          );
  }
}
