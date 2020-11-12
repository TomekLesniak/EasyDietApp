import 'package:EasyDietApp/helpers/db_helper.dart';
import 'package:EasyDietApp/models/meal_category.dart';
import 'package:flutter/material.dart';
import '../models/dish.dart';
import 'package:http/http.dart' as http;
import 'package:enum_to_string/enum_to_string.dart' as enumConverter;
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
      case 'second breakfest':
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

  Future<void> addDish(Map<String, Object> dish) async {
    var encodedDish = _encodeToJson(dish);
    final response = await DbHelper.instance().addDish(encodedDish);
    final decodedResponse = json.decode(response.body);
    _addDishLocally(decodedResponse['name'], dish);
  }

  void _addDishLocally(String dishId, Map<String, Object> dish) {
    _dishes.add(Dish(
        id: dishId,
        proteins: int.parse(dish['proteins']),
        calories: int.parse(dish['calories']),
        carbohydrates: int.parse(dish['carbohydrates']),
        fat: int.parse(dish['fat']),
        name: dish['name'],
        imageUrl: dish['url'],
        category: enumConverter.EnumToString.fromString(MealCategory.values, dish['category']),
        ingredients: ['a', 'b', 'c']));

    notifyListeners();
  }

  String _encodeToJson(Map<String, Object> data) {
    return json.encode(data);
  }

  Future<void> fetchAndSetDishes() async {
    if (_dishes.isEmpty) {
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
