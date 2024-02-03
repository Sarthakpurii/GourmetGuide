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
    int stepNo=0;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title,style: GoogleFonts.raleway(fontSize: 20,fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
              onPressed: () {
                bool isAdded=ref.read(favoriteMealProvider.notifier).toggleFavMeal(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isAdded?'Added to Favorites':'Removed from Favorites')));
              },
              icon: Icon(ref.watch(favoriteMealProvider).contains(meal)?Icons.star:Icons.star_border))
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
              (e)  {stepNo++;
                return Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stepNo.toString()+". "+e,
                      
                      style: GoogleFonts.mulish(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );}
            ),
          ],
        ),
      ),
    );
  }
}
