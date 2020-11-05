import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final IconData icon;

  CategoryItem(this.categoryName, this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/category-screen', arguments: categoryName);
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: 300,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.lime,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
