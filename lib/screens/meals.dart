import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  @override
  @override
  Widget build(BuildContext context) {
    Widget content;

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh-oh! ..... Nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }

  // Widget build(BuildContext context) {
  //   Widget content = ListView.builder(
  //     itemBuilder: (ctx, index) => Text(
  //       meals[index].title,
  //     ),
  //   );
  //   if (meals.isEmpty) {
  //     content = Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             'Uh-oh! ..... Nothing here!',
  //             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
  //                   color: Theme.of(context).colorScheme.onBackground,
  //                 ),
  //           ),
  //           const SizedBox(height: 16),
  //           Text(
  //             'Try selecting a different category',
  //             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
  //                   color: Theme.of(context).colorScheme.onBackground,
  //                 ),
  //           ),
  //         ],
  //       ),
  //     );
  //     if (meals.isNotEmpty) {
  //       content = ListView.builder(
  //         itemCount: meals.length,
  //         itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
  //       );
  //     }
  //   }

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(title),
  //     ),
  //     body: content,
  //   );
  // }
}
