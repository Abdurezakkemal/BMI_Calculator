import 'package:flutter/material.dart';
import 'pages/gender_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 246, 246, 248),
        scaffoldBackgroundColor: const Color.fromARGB(255, 233, 234, 239),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color(0xFF0A0E21),
          secondary: Colors.pink,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 0,
        ),
      ),
      home: const GenderPage(),
    );
  }
}
