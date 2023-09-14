import 'package:flutter/material.dart';
import 'package:practice_meals_app/screens/meals_details_screen.dart';
// import 'package:practice_meals_app/data/dummy_data.dart';
import 'package:practice_meals_app/widgets/meals_item.dart';
// import 'package:practice_meals_app/models/category.dart';
import 'package:practice_meals_app/models/meal.dart';
 
class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, });  
  final String? title;
  final List<Meal> meals;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealsItem( 
        meal: meals[index],
        onSelectMeal: (ctx) {
          selectMeal(context, meals[index]);
        },
      ),
    );
    if (meals.isEmpty) {
      content = content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Uh oh .....Nothing here',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ]),
      );
    }
    if (title == null){
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
