import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:practice_meals_app/screens/category_screen.dart';
import 'package:practice_meals_app/screens/filters_sreen.dart';
import 'package:practice_meals_app/screens/meals_screen.dart';
// import 'package:practice_meals_app/models/category.dart';

import 'package:practice_meals_app/widgets/main_drawer.dart';
import 'package:practice_meals_app/providers/meals_provider.dart';
import 'package:practice_meals_app/providers/favorite_meals_provider.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  Map<Filters, bool> _filteredMeals = kInitialFilters;

  int _navItemIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _navItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsprovider);
    final availableMeals = meals.where((meal) {
      if (_filteredMeals[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filteredMeals[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filteredMeals[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_filteredMeals[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget content = CategoriesScreen(
      filteredMeals: availableMeals,
    );
    String appBarTitle = 'Categories';

    void onSelectMainDrawerItem(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == "Filters") {
        final result = await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(
            builder: (ctx) => FilterScreen(currentFilters: _filteredMeals),
          ),
        );
        setState(() {
          _filteredMeals = result ?? kInitialFilters;
        });
      }
    }

    if (_navItemIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealProvider);
      appBarTitle = 'Favorites';
      content = MealsScreen(
        meals: favoriteMeals,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: content,
      drawer: MainDrawer(sideNavigationSelector: onSelectMainDrawerItem),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          currentIndex: _navItemIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.set_meal),
            ),
            BottomNavigationBarItem(
              label: 'Your Favorites',
              icon: Icon(Icons.star),
            ),
          ]),
    );
  }
}
