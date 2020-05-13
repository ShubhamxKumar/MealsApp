import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

import 'package:Meals/screens/selectedCategoryScreen.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final List<MealModel> availList;
  CategoryTile({this.title, this.color, this.id, this.availList});
  void NavigatorFunction(BuildContext ctx) {
    // Navigator function requires build context to work, and since we are calling it from the outside of build method we should pass the context.
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (ctx) {
        return SelectedCategoryScreen(
          catTitle: title,
          catColor: color,
          catId: id,
          appliedFilters: availList,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorFunction(context);
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Raleway',
          ),
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // this is provide a gradient look, and in this case its linear gradient
            colors: [
              color.withOpacity(0.5),
              color,
            ], // this is a list of colors that are to be showed in the gradient.
            begin:
                Alignment.bottomLeft, // defines where the gradient will start
            end: Alignment.topRight, // defines where the gradient stops.
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
