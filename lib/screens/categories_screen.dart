//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/data/dummy_data.dart';
import 'package:flutter_application_4/models/meal.dart';
import 'package:flutter_application_4/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2),
      children: [
        for (final cat in availableCategories)
          CategoryGridItem(
              category: cat,
              onToggleFavorite: onToggleFavorite,
              availableMeals: availableMeals)
      ],
    );
  }
}
