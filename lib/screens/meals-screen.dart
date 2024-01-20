import 'package:flutter/material.dart';
import 'package:gourmet/models/meal.dart';

class MealsScreen extends StatelessWidget{
  MealsScreen({super.key,required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(itemCount: meals.length,
        itemBuilder:(ctx, index)=> Meals ),
    );
  }
}