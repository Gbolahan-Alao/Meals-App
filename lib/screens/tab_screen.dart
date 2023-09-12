import 'package:flutter/material.dart';
import 'package:practice_meals_app/data/dummy_data.dart';
import 'package:practice_meals_app/screens/category_screen.dart';
import 'package:practice_meals_app/screens/filters_sreen.dart';
import 'package:practice_meals_app/screens/meals_screen.dart';
// import 'package:practice_meals_app/models/category.dart';
import 'package:practice_meals_app/models/meal.dart';
import 'package:practice_meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false
};

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  Map<Filters, bool> _filteredMeals = kInitialFilters;

  void _showFavoriteMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  final List<Meal> favoriteMeals = [];
  void setFavoriteMeals(Meal meal) {
    final isFavorite = favoriteMeals.contains(meal);
    if (isFavorite) {
      setState(() {
        favoriteMeals.remove(meal);
        _showFavoriteMessage('Removed from favorites');
      });
    }
    if (!isFavorite) {
      setState(() {
        favoriteMeals.add(meal);
        _showFavoriteMessage('Marked as favorites');
      });
    }
  }

  int _navItemIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _navItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
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
      onSetFavoriteMeal: setFavoriteMeals,filteredMeals:availableMeals ,
    );
    String appBarTitle = 'Categories';

    void onSelectMainDrawerItem(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == "Filters") {
        final result = await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(
            builder: (ctx) =>  FilterScreen(currentFilters: _filteredMeals),
          ),
        );
        setState(() {
          _filteredMeals = result ?? kInitialFilters;
        });
      }
    }

    if (_navItemIndex == 1) {
      appBarTitle = 'Favorites';
      content = MealsScreen(
        meals: favoriteMeals,
        onSetFavorites: setFavoriteMeals,
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
