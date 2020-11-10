import 'package:http/http.dart' as http;

import '../models/dish.dart';
class DbHelper {
  static final DbHelper _instance = DbHelper._internal();

  factory DbHelper.instance() {
    return _instance;
  }

  DbHelper._internal();


  Future<List<Dish>> getDishes() {
    return null;
  }

  Future<http.Response> addDish(String encodedDish) async {
  var url = 'https://easydiet-9b265.firebaseio.com/dishes.json';
  return await http.post(url, body: encodedDish);
  }
}