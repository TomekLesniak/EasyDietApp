import 'package:EasyDietApp/models/meal_category.dart';
import 'package:flutter/material.dart';
import '../models/dish.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dishes with ChangeNotifier {
  List<Dish> _dishes = [];

  List<Dish> getDishes(String categoryName) {
    categoryName = categoryName.toLowerCase();
    MealCategory selectedCategory;
    switch(categoryName) {
      case 'breakfest':
        selectedCategory = MealCategory.breakfast;
        break;
      case 'secondbreakfest':
        selectedCategory = MealCategory.secondBreakfest;
        break;
      case 'dinner':
        selectedCategory = MealCategory.dinner;
        break;
      case 'supper':
        selectedCategory = MealCategory.supper;
        break;
    }
    return _dishes.where((dish) => dish.category == selectedCategory).toList();
  }

  Future<void> fetchAndSetDishes() async {
    var url = 'https://easydiet-9b265.firebaseio.com/dishes.json';

    if(_dishes.isEmpty) {
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
          id: 'd1',
          calories: 400,
          carbohydrates: 20,
          fat: 10,
          proteins: 30,
          name: 'Dinner',
          ingredients: ['Rice', 'rice', 'another_one'],
          category: MealCategory.dinner,
          imageUrl: 'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78'),
    ];
    notifyListeners();
    }
  }
}
