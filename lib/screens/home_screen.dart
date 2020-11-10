import 'package:flutter/material.dart';

import '../screens/add_dish_screen.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DishesScreen'),
        ),
        backgroundColor: Colors.blueGrey,
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem('Breakfest', Icons.breakfast_dining),
                CategoryItem('Second Breakfest', Icons.looks_two),
                CategoryItem('Dinner', Icons.restaurant),
                CategoryItem('Supper', Icons.night_shelter),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.of(context).pushNamed(AddDishScreen.routeName),
          child: Icon(Icons.add, color: Theme.of(context).accentColor,),
        ));
  }
}
