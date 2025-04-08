import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
  
}

class _TabsScreenState extends State<TabsScreen> {
 int _selectedPageIndex = 0;

 void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
 }

  @override
  Widget build(BuildContext context) {
    Widget activepage = const CategoriesScreen();
    var activepageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activepage = const MealsScreen(meals: []);
      activepageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitle),
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
