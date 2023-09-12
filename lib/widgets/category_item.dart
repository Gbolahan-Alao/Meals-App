import 'package:flutter/material.dart';
import 'package:practice_meals_app/models/category.dart';
import 'package:practice_meals_app/models/meal.dart';  
import 'package:practice_meals_app/screens/meals_screen.dart';
// import 'package:practice_meals_app/data/dummy_data.dart';
    
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.onSetFavoriteMeal, required this.availableMeals});
  final Category category;
  final void Function (Meal meal) onSetFavoriteMeal;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    void onSelectCategory(Category category) {
      final filteredMeals = availableMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => MealsScreen(meals: filteredMeals,
                    title: category.title, onSetFavorites: onSetFavoriteMeal,
                  )));
    }

    return InkWell(
      onTap: () {
        onSelectCategory(category);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(.55),
              category.color.withOpacity(.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          )),
    );
  }
}
