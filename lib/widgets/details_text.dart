import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  final String ingredient;

  DetailsText(this.ingredient);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(ingredient, style: Theme.of(context).textTheme.headline6,),
    );
  }
}