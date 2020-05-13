import 'package:Meals/main.dart';
import 'package:Meals/models/meal.dart';
import 'package:Meals/screens/filterScreen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final double heightAppBar;
  MyDrawer(this.heightAppBar);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: heightAppBar,
            color: Colors.teal,
            child: Center(
              child: Text(
                'Hello Foodies!',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            height: 180,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyApp()));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.fastfood),
                      Text(
                        ' Meals',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(// this automatically replace the previous screen rather than push on it.
                      context,
                      MaterialPageRoute(builder: (ctx) {
                        
                        return FilterScreen();
                      }),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.settings),
                      Text(
                        ' Filters',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
