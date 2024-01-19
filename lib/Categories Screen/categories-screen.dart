

import 'package:flutter/material.dart';
import 'package:gourmet/Categories%20Screen/Category%20Widget/category-widget-builder.dart';
import 'package:gourmet/data/dummy-data.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("GourmetGuide")),
      body: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15,mainAxisSpacing: 15,childAspectRatio: 1.4),
      padding: const EdgeInsets.all(24),
      children: availableCategories.map((e) => CategoryBuilder(category: e)).toList(),),

        
    );
  }
}