import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/models/meal.dart';
import 'package:gourmet/provider/favorite-meal-provider.dart';
import 'package:transparent_image/transparent_image.dart';


class MealItemScreen extends ConsumerWidget {
  const MealItemScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                bool isAdded=ref.read(favoriteMealProvider.notifier).toggleFavMeal(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isAdded?'Added to Favorites':'Removed from Favorites')));
              },
              icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Ingredients',
              style: GoogleFonts.playfairDisplaySc(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.ingredients.map((e) => Column(
                  children: [
                    Text(
                      e,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.satisfy(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: GoogleFonts.playfairDisplaySc(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.steps.map(
              (e) => Column(
                children: [
                  Text(
                    e,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.aleo(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
