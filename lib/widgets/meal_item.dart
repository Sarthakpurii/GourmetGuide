//b1 611
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.selectMeal});

  final Meal meal;
  final void Function() selectMeal;

  @override
  Widget build(context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme
      )),
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: selectMeal,
          splashColor: Theme.of(context).primaryColor,
          child: Stack(children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover),
            ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: const Color.fromARGB(163, 0, 0, 0),
                    padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                    child: Column(
                      children: [
                        Text(meal.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                        const SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/duration.png',scale: 30,color: Colors.white,),
                            Text(' ${meal.duration} min'),
                            const SizedBox(width: 15,),
                            Image.asset('assets/icons/complex.png',scale: 30,color: Colors.white,),
                            Text(' ${meal.complexity.name}'),
                            const SizedBox(width: 15,),
                            Image.asset('assets/icons/cost.png',scale: 30,color: Colors.white,),
                            Text(' ${meal.affordability.name}')
                        ],)],
                    ),
                  ))
          ]),
        ),
      ),
    );
  }
}
