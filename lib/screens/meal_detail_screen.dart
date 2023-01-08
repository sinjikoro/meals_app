import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routePath = '/meal-detail';
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Text('The meal - $mealId'),
    );
  }
}
