import 'package:Meals/models/meal.dart';
import 'package:Meals/screens/favouriteScreen.dart';
import 'package:Meals/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Meals/screens/categories_screen.dart';
import 'package:Meals/dummyDataBase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  Map<String, bool> filteredChoice;
  MyApp({this.filteredChoice = const {
    'glutenFree' : false,
    'lactoseFree' : false,
    'isVegan' : false,
    'isVegetarian' : false,
  }});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  String _title = 'Categories';
  int _selectedScreenIndex = 0;
  void _selectedScreen(int index) {
    // the index argument is automatically provided by flutter on the tap of item in bottom nav bar.
    setState(() {
      _selectedScreenIndex = index;
      (_selectedScreenIndex == 1)
          ? _title = 'Favourites'
          : _title = 'Categories';
    });
  }
  @override
  Widget build(BuildContext context) {
  final List<Widget> _screen = [
    CategoriesScreen(filteredChoice: widget.filteredChoice,),
    FavouriteScreen(),
  ];
    final appBar = AppBar(
      centerTitle: true,
      title: Text(_title),
      backgroundColor: Colors.teal,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar,
        drawer: SafeArea( // it makes sure that everything gets rendered below the status bar.
          child: MyDrawer(appBar.preferredSize.height),// flutter provides us with a drawer itself so we don't have to build it.
        ), 
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          onTap: _selectedScreen,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favourites'),
            ),
          ],
        ),
        body: _screen[_selectedScreenIndex],
      ),
    );
  }
}
