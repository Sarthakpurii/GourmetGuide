import 'package:flutter/material.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/screens/meal-item-screen.dart';
import 'package:gourmet/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => MealItemScreen(meal: meal)));
  }

  @override
  Widget build(context) {
    Widget mainContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index],selectMeal: (){_selectMeal(context, meals[index]);}));
    if (meals.isEmpty) {
      mainContent = Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 0, 0, 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/icons/empty.png',
              scale: 3,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'No Recipes to show...',
              textAlign: TextAlign.start,
            )
          ]),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainContent,
    );
  }
}
