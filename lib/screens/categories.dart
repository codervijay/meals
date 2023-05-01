import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(
            title: category.title,
            meals: filteredMeals,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Categories'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category, onSelelectCategory: (){ _selectCategory(context, category);
            }),
        ],
      ),
    );
  }
}
