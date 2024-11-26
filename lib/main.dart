import 'package:flutter/material.dart';
import 'package:healthious_demo/screens/main_screen.dart';

void main() {
  runApp(NutritionApp());
}

class NutritionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Healthious',
        theme: ThemeData(primarySwatch: Colors.green),
        home: MainScreen());
  }
}
