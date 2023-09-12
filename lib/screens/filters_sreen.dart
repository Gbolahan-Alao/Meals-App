import 'package:flutter/material.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filters, bool> currentFilters;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterValue = false;
  var _lactoseFreeFilterValue = false;
  var _vegetarianFreeFilterValue = false;
  var _veganFilterValue = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterValue = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFreeFilterValue = widget.currentFilters[Filters.lactoseFree]!;
    _vegetarianFreeFilterValue = widget.currentFilters[Filters.vegetarian]!;
    _veganFilterValue = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFreeFilterValue,
            Filters.lactoseFree: _lactoseFreeFilterValue,
            Filters.vegan: _veganFilterValue,
            Filters.vegetarian: _vegetarianFreeFilterValue
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterValue,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterValue = isChecked;
                });
              },
              title: Text(
                'Glutten- Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _lactoseFreeFilterValue,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterValue = isChecked;
                });
              },
              title: Text(
                'Lactose- Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterValue,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterValue = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _veganFilterValue,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterValue = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
