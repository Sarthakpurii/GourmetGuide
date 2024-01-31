// 2232,1195
import 'package:flutter/material.dart';
import 'package:gourmet/data/dummy-data.dart';
import 'package:gourmet/models/category.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/screens/meals-screen.dart';
import 'package:gourmet/widgets/category-widget-builder.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.selectedMeals});

  final List<Meal> selectedMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        selectedMeals.where((meals) => meals.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals,)));
  }

  @override
  Widget build(context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.4),
        padding: const EdgeInsets.all(24),
        children: availableCategories
            .map((e) => CategoryBuilder(
                  category: e,
                  selectCategory: () {
                    _selectCategory(context,e);
                  },
                ))
            .toList(),
    );
  }
}
