import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenfilters) {
    state = chosenfilters;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; //not allowed => mutating state
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activefilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
