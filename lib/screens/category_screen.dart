import 'package:flutter/material.dart';
import 'package:practice_meals_app/data/dummy_data.dart';
import 'package:practice_meals_app/widgets/category_item.dart';
import 'package:practice_meals_app/models/meal.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,  required this.filteredMeals});
  
  final List<Meal> filteredMeals;
  @override
  Widget build(BuildContext context) {
    return  GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in availableCategories)
              CategoryItem(category: category ,availableMeals: filteredMeals,)
          ]);
  
  }
}
