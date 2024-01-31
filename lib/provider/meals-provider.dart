import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gourmet/data/dummy-data.dart';

final mealsProvider=Provider((ref){
  return dummyMeals;
});