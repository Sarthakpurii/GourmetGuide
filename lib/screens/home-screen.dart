
import 'package:flutter/material.dart';
import 'package:gourmet/data/dummy-data.dart';
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

  Map<Filter,bool> filtersData={
    Filter.GluttenFree: false,
    Filter.Vegetarian:false,
    Filter.LactoseFree:false,
    Filter.Vegan:false
  };

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  void showFavUpdateSnackbar(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier=='filters'){
      final result =await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(builder: (ctx)=>FilterScreen(filterData: filtersData,)));
    
    setState(() {
      filtersData=result??filtersData;
    });
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


  

  List<Meal> _selectedMeals=dummyMeals.where((meal) {
    if (filtersData[Filter.GluttenFree]!&&!meal.isGlutenFree) return false;
    if (filtersData[Filter.LactoseFree]!&&!meal.isLactoseFree) return false;
    if (filtersData[Filter.Vegetarian]!&&!meal.isVegetarian) return false;
    if (filtersData[Filter.Vegan]!&&!meal.isVegan) return false;
    return true;
  }).toList();

    Widget selectedPage=CategoriesScreen(toggleFav: _toggleFavorites,selectedMeals: _selectedMeals,);
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