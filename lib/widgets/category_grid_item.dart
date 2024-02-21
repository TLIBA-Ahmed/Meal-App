import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/meal.dart';
import 'package:flutter_application_4/screens/meals_screen.dart';
import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.availableMeals});
  final Category category;

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filteredMeal = availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MealScreen(
                  title: category.title,
                  meals: filteredMeal,
                )));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(.54),
                category.color.withOpacity(.9)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )),
    );
  }
}
