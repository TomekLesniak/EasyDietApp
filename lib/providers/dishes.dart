import 'package:EasyDietApp/models/meal_category.dart';
import 'package:flutter/material.dart';
import '../models/dish.dart';

class Dishes with ChangeNotifier {
  List<Dish> dishes = [
    Dish(
        id: 'd1',
        calories: 400,
        carbohydrates: 20,
        fat: 10,
        proteins: 30,
        name: 'breakfest',
        ingredients: ['Bread', 'test', 'another_one'],
        category: MealCategory.breakfast),
    Dish(
        id: 'd1',
        calories: 400,
        carbohydrates: 20,
        fat: 10,
        proteins: 30,
        name: 'Dinner',
        ingredients: ['Rice', 'rice', 'another_one'],
        category: MealCategory.dinner),
  ];
}
