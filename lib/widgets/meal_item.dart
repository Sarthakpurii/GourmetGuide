
import 'package:flutter/material.dart';
import 'package:gourmet/models/meal.dart';

class MealItem extends StatelessWidget{
  const MealItem({super.key, required this.meals});

  final List<Meal> meals;
  
  @override
  Widget build(context){
    Widget mainContent= Container();
    if meals.isEmpty{
      mainContent= Center(
        child: Column(children: [
          Image.asset()
        ]),
      )
    }
    return mainContent;
  }
}