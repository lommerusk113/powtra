import "package:flutter/material.dart";
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int stepCount = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchSteps();
  }

  Future<void> fetchSteps() async {
    setState(() => isLoading = true);
    try {
      final health = Health();
      await health.configure();

      final types = [HealthDataType.STEPS];
      if (await health.hasPermissions(types) != true) {
        await health.requestAuthorization(types);
      }

      final now = DateTime.now();
      final midnight = DateTime(now.year, now.month, now.day);
      final data = await health.getHealthDataFromTypes(
        startTime: midnight,
        endTime: now,
        types: types,
      );

      final total = data.fold<int>(
        0,
        (sum, point) =>
            sum + (point.value as NumericHealthValue).numericValue.toInt(),
      );

      setState(() => stepCount = total);
    } catch (e) {
      debugPrint('Error fetching steps: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Powtra')),
      body: Center(child: Text('Steps today: $stepCount')),
    );
  }
}
