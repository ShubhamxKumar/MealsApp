import 'package:Meals/screens/mealDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:Meals/models/meal.dart';

class MealTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;
  final Color color;
  MealTile({
    this.color = Colors.pinkAccent,
    this.id,
    this.imageUrl,
    this.title,
    this.duration,
    this.complexity,
    this.affordability,
  });
  String get getComplexityEnumValue {
    switch (complexity) {
      case Complexity.Simple:
        {
          return 'Simple';
        }
        break;
      case Complexity.Hard:
        {
          return 'Hard';
        }
        break;
      case Complexity.Challenging:
        {
          return 'Challenging';
        }
        break;
      default:
        {
          return 'Surprise';
        }
    }
  }

  String get getAffordabilityEnumValue {
    switch (affordability) {
      case Affordability.Affordable:
        {
          return 'Affordable';
        }
        break;
      case Affordability.Luxurious:
        {
          return 'Luxurious';
        }
        break;
      case Affordability.Pricey:
        {
          return 'Pricey';
        }
        break;
      default:
        {
          return 'Unknown';
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) {
            return MealDetailScreen(
              mealID: id,
              color: color,
              affordability: getAffordabilityEnumValue,
              complexity: getComplexityEnumValue,
              duration: duration,
            );
          }),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 0,
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.6)),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Raleway',
                          ),
                          softWrap: true,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.flash_on,
                              color: Colors.black,
                            ),
                            Text(getComplexityEnumValue),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.black,
                            ),
                            Text(duration.toString()),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              color: Colors.black,
                            ),
                            Text(getAffordabilityEnumValue),
                          ],
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
