import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/models/category.dart';

class CategoryBuilder extends StatelessWidget{
  const CategoryBuilder({super.key,required this.category});

  final Category category;

  @override
  Widget build(context){
    return InkWell(
      onTap: () => {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.6),category.color
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight)
        ),
        child: Text(category.title,
        style: GoogleFonts.salsa(color: Colors.white,fontSize: 18),),
      ),
    );
  }
}