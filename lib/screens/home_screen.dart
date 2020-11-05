import 'package:flutter/material.dart';

import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DishesScreen'),
      ),
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
    );
  }
}
