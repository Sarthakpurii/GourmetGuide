
import 'package:flutter/material.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/screens/categories-screen.dart';
import 'package:gourmet/screens/meals-screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{

  int _selectedPageIndex=0;
  List<Meal> _favoriteMeals=[];

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  void _toggleFavorites(Meal meal){
    bool exist=_favoriteMeals.contains(meal);

    if (exist){
      setState(() {
        _favoriteMeals.remove(meal);
      });
    } else {
      _favoriteMeals.add(meal);
    }
  }

  @override
  Widget build(context){

    Widget selectedPage=const CategoriesScreen();
    String selectedPageTitle='GourmetGuide';

    if (_selectedPageIndex==1){
      selectedPage=const MealsScreen(meals: []);
      selectedPageTitle='Favorites';
    }



    return Scaffold(
      appBar: AppBar(title: Text(selectedPageTitle)),

      body: selectedPage,

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){_selectPage(index);},
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'Favorites'),
        ]),
    );
  }
}