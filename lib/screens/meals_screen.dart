import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/meal.dart';
import 'package:flutter_application_4/screens/meal_detail_screen.dart';
import 'package:flutter_application_4/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
                meal: meal,
                onSelectMeal: (Meal meal) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => MealDetailScreen(
                                meal: meal,
                              )));
                }))
            .toList(),
      ),
    );
  }
}
