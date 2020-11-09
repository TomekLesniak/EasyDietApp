import 'package:EasyDietApp/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final IconData icon;

  CategoryItem(this.categoryName, this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryScreen.routeName, arguments: categoryName);
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: 300,
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue,),
            Text(categoryName, style: Theme.of(context).textTheme.headline6,),
          ],
        ),
      ),
    );
  }
}
