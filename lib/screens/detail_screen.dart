import 'package:EasyDietApp/models/dish.dart';
import 'package:EasyDietApp/widgets/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    final dish = ModalRoute.of(context).settings.arguments as Dish;
    return Scaffold(
      appBar: AppBar(title: Text(dish.name),),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: FittedBox(
                  fit: BoxFit.cover,
                  // child: Image.network(dish.imageUrl),
                  child: Hero(
                    tag: dish.id,
                    child: Image.network(dish.imageUrl),
                  )),
              height: 250,
              width: double.infinity,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: double.infinity,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(12),
                child: Column(
                  children: [
                    ...dish.ingredients.map(
                      (ingredient) => Ingredient(
                        ingredient,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
