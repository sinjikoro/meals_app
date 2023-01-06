import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String id;
  final String title;

  const CategoryMealsScreen({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: const Center(child: Text('The Recipes for the category.')),
    );
  }
}