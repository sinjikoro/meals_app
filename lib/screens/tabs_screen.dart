import 'package:flutter/material.dart';
import 'package:meals_app/screens/main_drawer.dart';

import './categories_screen.dart';
import './favorite_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;

  const TabsScreen({super.key, required this.favoritedMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = <Map<String, Object>>[
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoriteScreen(
          favoritedMeals: widget.favoritedMeals,
        ),
        'title': 'Your Favorite'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.greenAccent,
        selectedItemColor: Theme.of(context).selectedRowColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectPageIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
