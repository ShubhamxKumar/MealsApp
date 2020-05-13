import 'package:Meals/main.dart';
import 'package:Meals/models/meal.dart';
import 'package:Meals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  Map<String, bool> choice = {
    'glutenFree' : false,
    'lactoseFree' : false,
    'isVegan' : false,
    'isVegetarian' : false,
  };
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text('Filters'),
      backgroundColor: Colors.teal,
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              print(choice);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyApp(filteredChoice: choice,)));
            },
            child: Text(
              'Save',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Raleway'),
            ))
      ],
    );
    return Scaffold(
      appBar: appBar,
      drawer: MyDrawer(appBar.preferredSize.height),
      body: ListView(
        children: <Widget>[
          Container(
            height: appBar.preferredSize.height,
            child: Center(
              child: Text(
                'Select your filters',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SwitchListTile(
            value: choice['glutenFree'],
            onChanged: (value) {
              // value argument provided by flutter used to toggle the bool value here.
              setState(() {
                choice['glutenFree'] = value;
              });
            },
            title: Text('Gluten Free'),
            subtitle: Text('Only Gluten free meals will appear.'),
            activeColor: Colors.teal,
          ),
          SwitchListTile(
            value: choice['lactoseFree'],
            onChanged: (value) {
              setState(() {
                choice['lactoseFree'] = value;
              });
            },
            title: Text('Lactose Free'),
            subtitle: Text('Only Lactose free meals will appear.'),
            activeColor: Colors.teal,
          ),
          SwitchListTile(
            value: choice['isVegan'],
            onChanged: (value) {
              setState(() {
                choice['isVegan'] = value;
              });
            },
            title: Text('Vegan Meals'),
            subtitle: Text('Only Vegan meals will appear.'),
            activeColor: Colors.teal,
          ),
          SwitchListTile(
            value: choice['isVegetarian'],
            onChanged: (value) {
              setState(() {
                choice['isVegetarian'] = value;
              });
            },
            title: Text('Vegetarian Meals'),
            subtitle: Text('Only Vegetarian meals will appear.'),
            activeColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
