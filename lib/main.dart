import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MindCardsApp());

class MindCardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindCards',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
