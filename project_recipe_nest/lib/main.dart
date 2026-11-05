import 'package:flutter/material.dart';
import 'package:project_recipe_nest/login_screen.dart';

void main() {
  runApp(const RecipeNest());
}

class RecipeNest extends StatelessWidget {
  const RecipeNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RecipeNest',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAF7F0),
        primaryColor: const Color(0xFF71866A),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF71866A)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
