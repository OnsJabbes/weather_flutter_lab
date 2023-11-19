import 'package:flutter/material.dart';
import 'weather.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Weather(), // Utilisez la page Weather comme page d'accueil
    );
  }
}
