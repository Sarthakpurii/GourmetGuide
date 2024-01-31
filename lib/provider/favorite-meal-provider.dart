import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gourmet/models/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealNotifier():super([]);

  bool toggleFavMeal(Meal meal){
    final bool isFav=state.contains(meal);

    if (isFav){
      state=state.where((element) => meal.id != element.id).toList();
      return false;
    } else {
      state=[...state,meal];
      return true;
    }
  }
}

final favoriteMealProvider=StateNotifierProvider<FavoriteMealNotifier,List<Meal>>((ref) {
  return FavoriteMealNotifier();
});