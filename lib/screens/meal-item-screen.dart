import 'package:flutter/material.dart';
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
      ),
      body: Column(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl))
          ],
        ),
    );
  }
}
