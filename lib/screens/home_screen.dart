import 'package:flutter/material.dart';
import '../services/isar_service.dart';
import 'capacity_test_screen.dart';
import 'capacity_history_screen.dart';
import 'pose_workout_screen.dart';
import 'squat_workout_screen.dart';

class HomeScreen extends StatelessWidget {
  final IsarService isarService;

  const HomeScreen({super.key, required this.isarService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pop(); // go back to login
            },
          ),
        ],
      ),
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Welcome!\nYou are logged in.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 32),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CapacityTestScreen(isarService: isarService),
            ),
          );
        },
        child: const Text('Start Capacity Test'),
      ),
      const SizedBox(height: 16),
ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CapacityHistoryScreen(isarService: isarService),
      ),
    );
  },
  child: const Text('View Capacity History'),
),
const SizedBox(height: 16),
ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PoseWorkoutScreen(isarService: isarService),
      ),
    );
  },
  child: const Text('Start Push-up Tracking'),
),
const SizedBox(height: 16),
ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SquatWorkoutScreen(isarService: isarService),
      ),
    );
  },
  child: const Text('Start Squat Tracking'),
),
    ],
  ),
),
    );
  }
}