import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const String routePath = '/filter';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('filter')),
      body: const Center(
        child: Text('filter!'),
      ),
    );
  }
}
