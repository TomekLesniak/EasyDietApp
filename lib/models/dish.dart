import 'package:flutter/foundation.dart';

import 'meal_category.dart';

class Dish with ChangeNotifier{
  String id;
  String name;
  MealCategory category;
  int calories;
  int proteins;
  int fat;
  int carbohydrates;
  List<String> ingredients;

  Dish(
      {@required this.id,
      @required this.name,
      @required this.category,
      @required this.calories,
      @required this.carbohydrates,
      @required this.fat,
      @required this.ingredients,
      @required this.proteins});
}
