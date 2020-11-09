import 'package:EasyDietApp/providers/dishes.dart';
import 'package:EasyDietApp/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// screens
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Dishes()),
      ],
          child: MaterialApp(
        title: 'Easy Diet',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.white,
          textTheme: TextTheme(headline6: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold))
        ),
        home: HomeScreen(),
        routes: {
          CategoryScreen.routeName: (ctx) => CategoryScreen(),
        },
      ),
    );
  }
}
