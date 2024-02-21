import 'package:flutter_application_4/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
      //state.remove(meal)
      //_showinfomsg("Meal is no longer a favorite");
    } else {
      state = [...state, meal];
      return true;
      //state.add(meal);

      //_showinfomsg('Marked as a favorite');
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
