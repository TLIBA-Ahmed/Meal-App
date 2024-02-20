import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexitytext {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilitytext {
    switch (meal.affordability) {
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () => onSelectMeal(meal),
          child: Stack(
            children: [
              FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(children: [
                            const Icon(Icons.schedule),
                            const SizedBox(width: 5),
                            Text("${meal.duration} min",
                                style: const TextStyle(color: Colors.white))
                          ]),
                          Row(children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 5),
                            Text(complexitytext,
                                style: const TextStyle(color: Colors.white))
                          ]),
                          Row(children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 1),
                            Text(affordabilitytext,
                                style: const TextStyle(color: Colors.white))
                          ]),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
