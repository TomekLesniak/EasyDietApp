import 'package:EasyDietApp/models/meal_category.dart';
import 'package:flutter/material.dart';

class FormRadio extends StatelessWidget {
  final MealCategory radioValue;
  final MealCategory groupValue;
  final Function handleRadioValueChange;

  FormRadio(this.radioValue, this.groupValue, this.handleRadioValueChange);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Radio(
        value: radioValue,
        groupValue: groupValue,
        onChanged: handleRadioValueChange,
        activeColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
