import 'package:flutter/material.dart';
import '../models/capacity_test.dart';
import '../services/isar_service.dart';

class CapacityHistoryScreen extends StatefulWidget {
  final IsarService isarService;

  const CapacityHistoryScreen({super.key, required this.isarService});

  @override
  State<CapacityHistoryScreen> createState() => _CapacityHistoryScreenState();
}

class _CapacityHistoryScreenState extends State<CapacityHistoryScreen> {
  List<CapacityTest> _tests = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTests();
  }

  Future<void> _loadTests() async {
    final tests = await widget.isarService.getCapacityTests();
    setState(() {
      _tests = tests;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capacity History')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _tests.isEmpty
              ? const Center(child: Text('No tests saved yet'))
              : ListView.builder(
                  itemCount: _tests.length,
                  itemBuilder: (context, index) {
                    final test = _tests[index];
                    return ListTile(
                      title: Text(test.exerciseType.toUpperCase()),
                      subtitle: Text(
                        '${test.maxReps} reps • ${_formatDate(test.date)}',
                      ),
                      trailing: const Icon(Icons.fitness_center),
                    );
                  },
                ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}