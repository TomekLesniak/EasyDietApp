import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dishes.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
        _isLoading = true;
        Provider.of<Dishes>(context, listen: false)
            .fetchAndSetDishes()
            .then((_) {
              setState(() {
              _isLoading = false;
              });
            } );
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context).settings.arguments as String;
    final dishesData = Provider.of<Dishes>(context, listen: false);
    final dishes = dishesData.getDishes(categoryName);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: _isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: dishes.length,
              itemBuilder: (ctx, index) => Text(dishes[index].name),
            ),
    );
  }
}
