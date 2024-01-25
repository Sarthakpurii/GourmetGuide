
import 'package:flutter/material.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/screens/categories-screen.dart';
import 'package:gourmet/screens/filters-screen.dart';
import 'package:gourmet/screens/meals-screen.dart';
import 'package:gourmet/widgets/home-side-drawer.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{

  int _selectedPageIndex=0;
  final List<Meal> _favoriteMeals=[];

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  void showFavUpdateSnackbar(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _setScreen(String identifier){
    Navigator.of(context).pop();
    if (identifier=='filters'){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>FilterScreen()));
    }
  }

  void _toggleFavorites(Meal meal){
    bool exist=_favoriteMeals.contains(meal);

    if (exist){
      setState(() {
        _favoriteMeals.remove(meal);
        showFavUpdateSnackbar('Removed from Favorites');
      });
    } else {
      _favoriteMeals.add(meal);
      showFavUpdateSnackbar('Added to Favorites');
    }
  }

  @override
  Widget build(context){

    Widget selectedPage=CategoriesScreen(toggleFav: _toggleFavorites,);
    String selectedPageTitle='GourmetGuide';

    if (_selectedPageIndex==1){
      selectedPage=MealsScreen(meals: _favoriteMeals,toggleFav: _toggleFavorites,);
      selectedPageTitle='Favorites';
    }



    return Scaffold(
      appBar: AppBar(title: Text(selectedPageTitle)),

      body: selectedPage,

      drawer: SideDrawer(setScreen: _setScreen,),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){_selectPage(index);},
        currentIndex: _selectedPageIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.folder),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites'),
        ]),
    );
  }
}