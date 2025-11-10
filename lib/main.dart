import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ExamsApp());
}

class ExamsApp extends StatelessWidget {
  const ExamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF3F51B5),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
