import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  const FavoriteScreen({super.key, required this.favoritedMeals});

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favoritedMeals[index].id,
              title: favoritedMeals[index].title,
              imageUrl: favoritedMeals[index].imageUrl,
              duration: favoritedMeals[index].duration,
              complexity: favoritedMeals[index].complexity,
              affordability: favoritedMeals[index].affordability);
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
