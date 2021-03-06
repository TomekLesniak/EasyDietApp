import 'package:EasyDietApp/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/detail_screen.dart';

class DishItem extends StatelessWidget {


  void openDetailedPage(BuildContext ctx, Dish dish) {
    Navigator.of(ctx).pushNamed(DetailScreen.routeName, arguments: dish);
  }

  @override
  Widget build(BuildContext context) {
    final dish = Provider.of<Dish>(context, listen: false);
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => openDetailedPage(context, dish),
              child: Container(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    FittedBox(
                      // child: Image.network(dish.imageUrl),
                      child: Hero(
                        child: Image.network(dish.imageUrl),
                        tag: dish.id,
                      ),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 3,
                      bottom: 3,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Carbohydrates: ${dish.carbohydrates}',
                                style: Theme.of(context).textTheme.headline6),
                            Text('Fat: ${dish.fat}',
                                style: Theme.of(context).textTheme.headline6),
                            Text('Proteins: ${dish.proteins}',
                                style: Theme.of(context).textTheme.headline6),
                          ],
                        ),
                      ),
                    )
                  ],
                  fit: StackFit.expand,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 46,
              ),
              title: Text(dish.name),
              trailing: Text('Calories: ${dish.calories}'),
              onTap: () => openDetailedPage(context, dish),
            )
          ],
        ),
      ),
    ));
  }
}
