import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/meal.dart';
import 'package:flutter_application_4/provider/favorites_provider.dart';
import 'package:flutter_application_4/provider/meals_provider.dart';
import 'package:flutter_application_4/screens/categories_screen.dart';
import 'package:flutter_application_4/screens/filters_screen.dart';
import 'package:flutter_application_4/screens/meals_screen.dart';
import 'package:flutter_application_4/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilter = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilter;

  void _setScreen(String identifier) {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) =>
                  FiltersScreen(currentFilters: _selectedFilters))).then(
          (value) =>
              setState(() => _selectedFilters = value ?? kInitialFilter));
    } else {
      Navigator.of(context).pop();
    }
  }

  void _showinfomsg(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final List<Meal> availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    var activePageTitle = 'Pick your category';
    if (_selectedPageIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoriteMealsProvider);
      activePage = MealScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ]),
    );
  }
}
