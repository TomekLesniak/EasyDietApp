import 'package:flutter/material.dart';

class DishItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  DishItem(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: FittedBox(
                child: Image.network(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            ListTile(

              leading: Icon(Icons.restaurant, size: 46,),
              title: Text(name),
              subtitle: Text('s'),
              trailing: Text('Calories: ${name}'),
            )
          ],
      ),
    ),
        ));
  }
}
