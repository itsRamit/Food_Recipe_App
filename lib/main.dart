import 'package:flutter/material.dart';
import 'package:food_recipe/CookScreen.dart';
import 'package:food_recipe/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showSelectedLabels: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black38),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'big'),
    );
  }
}
