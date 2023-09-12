import 'package:flutter/material.dart';
import 'package:practice_meals_app/models/meal.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen(
      {super.key, required this.meal, required this.onSetFavoriteMeal});
  final Meal meal;
  final void Function(Meal meal) onSetFavoriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onSetFavoriteMeal(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 196, 149, 20),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 14,
              ),
              ...meal.ingredients.map((ingredient) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: Text(
                      ingredient,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 196, 149, 20),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              for (final step in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
