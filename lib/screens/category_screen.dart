import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/dishes.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final x = Provider.of<Dishes>(context);
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (ctx, index) => Text(x.dishes[index].name),
    );
  }
}