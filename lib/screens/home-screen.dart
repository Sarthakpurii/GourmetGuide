
import 'package:flutter/material.dart';
import 'package:gourmet/data/dummy-data.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/provider/favorite-meal-provider.dart';
import 'package:gourmet/provider/meals-provider.dart';
import 'package:gourmet/screens/categories-screen.dart';
import 'package:gourmet/screens/filters-screen.dart';
import 'package:gourmet/screens/meals-screen.dart';
import 'package:gourmet/widgets/home-side-drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget{
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen>{

  

  int _selectedPageIndex=0;

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


  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier=='filters'){
      final result =await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(builder: (ctx)=>FilterScreen(filterData: filtersData,)));
    
    setState(() {
      filtersData=result??filtersData;
    });
    }
  }

  @override
  Widget build(context){

  final meals=ref.watch(mealsProvider);
  

  List<Meal> _selectedMeals=meals.where((meal) {
    if (filtersData[Filter.GluttenFree]!&&!meal.isGlutenFree) return false;
    if (filtersData[Filter.LactoseFree]!&&!meal.isLactoseFree) return false;
    if (filtersData[Filter.Vegetarian]!&&!meal.isVegetarian) return false;
    if (filtersData[Filter.Vegan]!&&!meal.isVegan) return false;
    return true;
  }).toList();

    Widget selectedPage=CategoriesScreen(selectedMeals: _selectedMeals,);
    String selectedPageTitle='GourmetGuide';

    if (_selectedPageIndex==1){
      final favoriteMeals=ref.watch(favoriteMealProvider);
      selectedPage=MealsScreen(meals: favoriteMeals,);
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