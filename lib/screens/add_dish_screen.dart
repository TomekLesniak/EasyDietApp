import 'package:EasyDietApp/models/meal_category.dart';
import 'package:EasyDietApp/widgets/form_radio.dart';
import 'package:flutter/material.dart';

class AddDishScreen extends StatefulWidget {
  static const routeName = '/add-dish-screen';

  @override
  _AddDishScreenState createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  final _formKey = GlobalKey<FormState>();
  var _radioValue = MealCategory.breakfast;

  void _handleRadioValueChange(MealCategory value) {
    setState(() {
      _radioValue = value;
    });
    print(_radioValue);
  }

  Widget formText(BuildContext context, String text) {
    return Text(text, style: Theme.of(context).textTheme.headline6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new dish!'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(12),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: Theme.of(context).textTheme.headline6),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(thickness: 2,),
                      formText(context, 'Category:'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          formText(context, 'Breakfest'),
                          FormRadio(MealCategory.breakfast, _radioValue,
                              _handleRadioValueChange),
                          formText(context, 'Second Breakfest'),
                          FormRadio(MealCategory.secondBreakfest, _radioValue,
                              _handleRadioValueChange),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          formText(context, 'Dinner'),
                          FormRadio(MealCategory.dinner, _radioValue,
                              _handleRadioValueChange),
                          formText(context, 'Supper'),
                          FormRadio(MealCategory.supper, _radioValue,
                              _handleRadioValueChange),
                        ],
                      ),
                      Divider(thickness: 2,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
