import 'package:EasyDietApp/models/meal_category.dart';
import 'package:flutter/material.dart';
import '../models/dish.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dishes with ChangeNotifier {
  List<Dish> _dishes = [];

  List<Dish> getDishes(String categoryName) {
    MealCategory selectedCategory = _getCategoryFromName(categoryName);
    return _dishes.where((dish) => dish.category == selectedCategory).toList();
  }

  MealCategory _getCategoryFromName(String categoryName) {
    categoryName = categoryName.toLowerCase();
    switch (categoryName) {
      case 'breakfest':
        return MealCategory.breakfast;
        break;
      case 'secondbreakfest':
        return MealCategory.secondBreakfest;
        break;
      case 'dinner':
        return MealCategory.dinner;
        break;
      case 'supper':
        return MealCategory.supper;
        break;
      default:
        throw Exception('Category not implemented');
    }
  }

  Future<void> fetchAndSetDishes() async {
    var url = 'https://easydiet-9b265.firebaseio.com/dishes.json';

    if (_dishes.isEmpty) {
      final response = await http.post(url,
          body: json.encode({
            'name': 'breakfest',
            'ingredients': ['Bread', 'test']
          }));

      print(response.body);

      _dishes = [
        Dish(
            id: 'd1',
            calories: 400,
            carbohydrates: 20,
            fat: 10,
            proteins: 30,
            name: 'breakfest',
            ingredients: ['Bread', 'test', 'another_one'],
            category: MealCategory.breakfast,
            imageUrl: 'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
        Dish(
            id: 'd3',
            calories: 400,
            carbohydrates: 20,
            fat: 10,
            proteins: 30,
            name: 'breakfest2',
            ingredients: ['Bread', 'test', 'another_one'],
            category: MealCategory.breakfast,
            imageUrl: 'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
        Dish(
            id: 'd2',
            calories: 400,
            carbohydrates: 20,
            fat: 10,
            proteins: 30,
            name: 'breakfest',
            ingredients: ['Bread', 'test', 'another_one'],
            category: MealCategory.breakfast,
            imageUrl: 'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
        Dish(
            id: 'd4',
            calories: 400,
            carbohydrates: 20,
            fat: 10,
            proteins: 30,
            name: 'Dinner',
            ingredients: [
              'Rice',
              'rice',
              'another_one',
              'Rice',
              'rice',
              'another_one',
              'Rice',
              'rice',
              'another_one'
            ],
            category: MealCategory.dinner,
            imageUrl: 'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
      ];
      notifyListeners();
    }
  }

  
}
