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
                    Divider(
                      thickness: 2,
                    ),
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
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Calories',
                                labelStyle:
                                    Theme.of(context).textTheme.headline6),
                          ),
                        ),
                        SizedBox(width: 30),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Carbohydrates',
                                labelStyle:
                                    Theme.of(context).textTheme.headline6),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Fat',
                                labelStyle:
                                    Theme.of(context).textTheme.headline6),
                          ),
                        ),
                        SizedBox(width: 30),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Proteins',
                                labelStyle:
                                    Theme.of(context).textTheme.headline6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          width: 125,
                          height: 100,
                          child: Image.network(
                            'https://miro.medium.com/max/10000/0*wZAcNrIWFFjuJA78',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Url',
                                  labelStyle:
                                      Theme.of(context).textTheme.headline6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
