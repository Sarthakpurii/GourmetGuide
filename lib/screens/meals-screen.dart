import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/screens/meal-item-screen.dart';
import 'package:gourmet/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealItemScreen(
              meal: meal,
            )));
  }

  @override
  Widget build(context) {
    Widget mainContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            selectMeal: () {
              _selectMeal(context, meals[index]);
            }));
    if (meals.isEmpty) {
      mainContent = Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Image.asset(
              'assets/icons/empty.png',
              scale: 3,
              color: Colors.white70,
              
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'No Recipes Found.',
            textAlign: TextAlign.start,
            style: GoogleFonts.mulish(fontSize: 20,fontWeight: FontWeight.w600),
          )
        ]),
      );
    }

    if (title == null) {
      return mainContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!,style: GoogleFonts.raleway(fontSize: 20,fontWeight: FontWeight.w600)),
      ),
      body: mainContent,
    );
  }
}
