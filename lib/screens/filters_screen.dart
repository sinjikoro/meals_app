import 'package:flutter/material.dart';
import 'package:meals_app/screens/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String routePath = '/filter';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('filter')),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('filter!'),
      ),
    );
  }
}
