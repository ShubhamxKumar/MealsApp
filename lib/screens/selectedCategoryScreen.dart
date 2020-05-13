import 'package:Meals/models/meal.dart';
import 'package:Meals/widgets/mealTile.dart';
import 'package:flutter/material.dart';
import 'package:Meals/dummyDataBase.dart';

class SelectedCategoryScreen extends StatefulWidget {
  final String catTitle;
  final Color catColor;
  final String catId;
  final List<MealModel> appliedFilters;
  SelectedCategoryScreen({this.catTitle, this.catColor, this.catId, this.appliedFilters});

  @override
  _SelectedCategoryScreenState createState() => _SelectedCategoryScreenState();
}

class _SelectedCategoryScreenState extends State<SelectedCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final List<MealModel> filteredList = widget.appliedFilters.where((element) {
      // this returns a List of MealModel which containes the category which is tapped on in the Categories_screen.
      return element.categories.contains(widget
          .catId); // so if c1 is tapped on then this list will contain every meal that has c1 as a category.
    }).toList();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: widget.catColor,
            ),
          ),
          title: Text(
            widget.catTitle,
            style: TextStyle(
              color: widget.catColor,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          padding: EdgeInsets.only(bottom: 15),
          itemBuilder: (ctx, index) {
            return MealTile(
              id: filteredList[index].id,
              title: filteredList[index].title,
              imageUrl: filteredList[index].imageUrl,
              duration: filteredList[index].duration,
              affordability: filteredList[index].affordability,
              complexity: filteredList[index].complexity,
              color: widget.catColor,
            );
          },
          itemCount: filteredList.length,
        ));
  }
}
