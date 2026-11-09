import 'package:flutter/material.dart';
import '../models/capacity_test.dart';
import '../services/isar_service.dart';

class CapacityTestScreen extends StatefulWidget {
  final IsarService isarService;

  const CapacityTestScreen({super.key, required this.isarService});

  @override
  State<CapacityTestScreen> createState() => _CapacityTestScreenState();
}

class _CapacityTestScreenState extends State<CapacityTestScreen> {
  final _repsController = TextEditingController();
  String _selectedExercise = 'pushups';
  String? _message;

  final List<String> _exercises = ['pushups', 'squats', 'lunges', 'plank'];

  Future<void> _saveTest() async {
    final reps = int.tryParse(_repsController.text.trim());
    if (reps == null || reps <= 0) {
      setState(() => _message = 'Enter a valid number');
      return;
    }

    final test = CapacityTest()
      ..exerciseType = _selectedExercise
      ..maxReps = reps
      ..date = DateTime.now();

    await widget.isarService.saveCapacityTest(test);

    setState(() {
      _message = 'Saved: $_selectedExercise → $reps reps';
      _repsController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capacity Test')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'How many can you do right now?',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedExercise,
              items: _exercises
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _selectedExercise = value);
              },
              decoration: const InputDecoration(labelText: 'Exercise'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _repsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Max reps'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveTest,
              child: const Text('Save Result'),
            ),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(_message!),
            ],
          ],
        ),
      ),
    );
  }
}