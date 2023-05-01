
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index]);
        },
      ); 

    if (meals.isEmpty) {
      content = Center(
        child: Center(child:Column(children: const [
          Text('Uh oh ... nothing here', style: TextStyle(fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Colors.white)),
          SizedBox(height: 16),
          Text('Try changing your filters'),
        ],))
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}