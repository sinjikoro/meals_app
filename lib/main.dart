import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

import 'dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoritedMeals = [];

  _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] ?? false) && meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'] ?? false) && meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] ?? false) && meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] ?? false) && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex > 0) {
      setState(() => _favoritedMeals.removeAt(existingIndex));
    } else {
      setState(() => _favoritedMeals
          .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(
              favoritedMeals: _favoritedMeals,
            ),
        CategoryMealsScreen.routePath: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routePath: (context) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        FiltersScreen.routePath: ((context) => FiltersScreen(
              saveFilters: _setFilter,
              currentFilters: _filters,
            )),
      },
      onGenerateRoute: ((settings) {
        debugPrint(settings.arguments.toString());
        debugPrint('test');
        return null;
      }),
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: ((ctx) => const CategoriesScreen())),
    );
  }
}
