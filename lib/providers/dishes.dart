import 'package:EasyDietApp/models/meal_category.dart';
import 'package:flutter/material.dart';
import '../models/dish.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dishes with ChangeNotifier {
  List<Dish> dishes = [];

  Future<void> fetchAndSetDishes() async {
    var url = 'https://easydiet-9b265.firebaseio.com/dishes.json';
    if (dishes.isEmpty) {
      final response = await http.post(url,
          body: json.encode({
            'name': 'breakfest',
            'ingredients': ['Bread', 'test']
          }));
    print(response.body);
    }
    dishes = [
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
    return;
  }
}
