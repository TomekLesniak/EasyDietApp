import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dishes.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context).settings.arguments as String;
    final dishesData = Provider.of<Dishes>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: FutureBuilder(
        future: dishesData.fetchAndSetDishes(),
        builder: (ctx, dishesSnap) {
          if(dishesSnap.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();

          return ListView.builder(
            itemCount: dishesData.dishes.length,
            itemBuilder: (ctx, index) => Text(dishesData.dishes[index].name),
          );
        },
      ),
    );
  }
}
