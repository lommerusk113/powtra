import "package:flutter/material.dart";
import 'package:health/health.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Powtra')),
      body: const Center(child: Text('Hello World 3')),
    );
  }
}
