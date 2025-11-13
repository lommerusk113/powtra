import "package:flutter/material.dart";
import "pages/home_page.dart";

void main() {
  runApp(const Powtra());
}

class Powtra extends StatelessWidget {
  const Powtra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Powtra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
