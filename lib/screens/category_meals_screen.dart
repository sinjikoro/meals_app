import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routePath = '/category_meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen({
    super.key,
    required this.availableMeals,
  });

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealsScreen> {
  late String title;
  late List<Meal> displayMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final id = routeArgs['id'];
      title = routeArgs['title'] ?? '';
      displayMeals = widget.availableMeals.where(((meal) {
        return meal.categories.contains(id);
      })).toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              complexity: displayMeals[index].complexity,
              affordability: displayMeals[index].affordability,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
