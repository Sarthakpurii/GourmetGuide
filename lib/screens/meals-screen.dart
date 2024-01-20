import 'package:flutter/material.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  MealsScreen({super.key,required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(context){
    Widget mainContent= ListView.builder(itemCount: meals.length,
        itemBuilder:(ctx, index)=> MealItem(meals: meals) );
    if (meals.isEmpty){
      print('empty');
      mainContent= Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 0, 0, 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset('assets/icons/empty.png',scale: 3,color: Theme.of(context).textTheme.bodyMedium!.color,),
            const SizedBox(height: 15,),
            const Text('No Recipes to show...',textAlign: TextAlign.start,)
          ]),
        ),
      );
    }

    print(meals.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainContent,
    );
  }
}