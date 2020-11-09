import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  final String ingredient;

  Ingredient(this.ingredient);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(ingredient, style: Theme.of(context).textTheme.headline6,),
    );
  }
}