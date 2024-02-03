
import 'package:flutter/material.dart';
import 'package:gourmet/data/dummy-data.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/provider/favorite-meal-provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(elevation: 3,title: Text(selectedPageTitle, textAlign: TextAlign.start,style: GoogleFonts.raleway(fontSize: 20,fontWeight: FontWeight.w600), )
          ),

      body: selectedPage,

      drawer: SideDrawer(setScreen: _setScreen,),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 62, 12, 81),
        elevation: 10,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Color.fromARGB(255, 238, 102, 81),
        selectedLabelStyle: GoogleFonts.mulish(),
        unselectedLabelStyle: GoogleFonts.mulish(),
        onTap: (index){_selectPage(index);},
        currentIndex: _selectedPageIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.folder),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites'),
        ]),
    );
  }
}