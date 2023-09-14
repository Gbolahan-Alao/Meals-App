import 'package:flutter/material.dart';
import 'package:practice_meals_app/models/meal.dart';
import 'package:practice_meals_app/widgets/meals_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'package:practice_meals_app/screens/meals_details_screen.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityName {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityName {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  // void selectMeal(BuildContext context, Meal meal) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => MealsDetailsScreen(meal: meal),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealsItemTrait(
                            label: '${meal.duration} mins',
                            icon: Icons.schedule),
                        const SizedBox(
                          width: 12,
                        ),
                        MealsItemTrait(label: complexityName, icon: Icons.work),
                        MealsItemTrait(
                            label: affordabilityName, icon: Icons.attach_money)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
