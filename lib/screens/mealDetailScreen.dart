import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:Meals/dummyDataBase.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealID;
  final Color color;
  final String complexity;
  final String affordability;
  final int duration;
  MealDetailScreen({
    @required this.mealID,
    @required this.color,
    @required this.complexity,
    @required this.affordability,
    @required this.duration,
  });

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool _toggle = false;
  @override
  Widget build(BuildContext context) {
    final List<MealModel> selectedMeal = DUMMY_MealModelS.where((element) {
      // Now we have the meal that the user selected.
      return element.id.contains(widget
          .mealID); // here we are filtering against mealID so we will get only one item in list.
    }).toList();
    if ((favoriteMeals.indexWhere((meal) {
          return meal.id == selectedMeal[0].id;
        }) !=
        -1)) {
      setState(() {
        _toggle = true;
      });
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: widget.color,
          ),
        ),
        title: Text(
          selectedMeal[0].title,
          style: TextStyle(
            color: widget.color,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(bottom: 15),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Image.network(
              selectedMeal[0].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Text(
                  'Duration : ' + widget.duration.toString() + ' mins',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  'Affordabilty : ${widget.affordability}',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  'Complexity : ${widget.complexity}',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                'Ingredients:',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: selectedMeal[0].ingredients.map((item) {
                return IngredientContainer(item);
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                'Steps:',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: selectedMeal[0].steps.map((item) {
                return StepsContainer(item);
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _toggle = !_toggle;
          setState(() {
            if (_toggle) {
              favoriteMeals.add(selectedMeal[0]);
            }
            if (!_toggle) {
              favoriteMeals.remove(selectedMeal[0]);
            }
          });
          print(_toggle);
        },
        child: Icon(_toggle ? Icons.star : Icons.star_border),
      ),
    );
  }
}

class IngredientContainer extends StatelessWidget {
  final String line;
  IngredientContainer(@required this.line);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            ' ' + line,
            textAlign: TextAlign.start,
            softWrap: true,
            style: TextStyle(fontFamily: 'Roboto', fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class StepsContainer extends StatelessWidget {
  final String line;
  StepsContainer(@required this.line);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 18,
            child: Text(
              ' ' + line,
              softWrap: true,
              overflow: TextOverflow.fade,
              style: TextStyle(fontFamily: 'Roboto', fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
