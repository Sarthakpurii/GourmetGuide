import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemScreen extends StatelessWidget {
  const MealItemScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.star))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),

                
            const SizedBox(height: 12,),


            Text(
              'Ingredients',
              style: GoogleFonts.playfairDisplaySc(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            ...meal.ingredients.map((e) => Column(
              children: [
                Text(e,
                textAlign: TextAlign.center,
                style: GoogleFonts.satisfy(
                  fontSize: 15
                ),),
                const SizedBox(height: 3,)
              ],)),


            const SizedBox(height: 20,),


            Text('Steps',
            style: GoogleFonts.playfairDisplaySc(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),),

            const SizedBox(height: 10,),

            ...meal.steps.map((e) => Column(
              children: [
                Text(e,
                textAlign: TextAlign.center,
                style: GoogleFonts.aleo(
                  fontSize: 17
                ),),
                const SizedBox(height: 8,)
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
