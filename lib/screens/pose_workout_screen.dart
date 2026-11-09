import 'package:flutter/material.dart';
import 'package:live_pose_detector/live_pose_detector.dart';
import '../services/isar_service.dart';

class PoseWorkoutScreen extends StatefulWidget {
  final IsarService isarService;

  const PoseWorkoutScreen({super.key, required this.isarService});

  @override
  State<PoseWorkoutScreen> createState() => _PoseWorkoutScreenState();
}

class _PoseWorkoutScreenState extends State<PoseWorkoutScreen> {
  final _detector = PushUpFormDetector();
  final _feedback = ValueNotifier<PushUpFeedback?>(null);
  int _reps = 0;

  @override
  void dispose() {
    _feedback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Push-up Counter')),
      body: Stack(
        children: [
          CameraPoseView(
            onPosesDetected: (poses) {
              final result = _detector.evaluate(poses);
              _feedback.value = result;

              if (result != null && result.repCount != _reps) {
                setState(() => _reps = result.repCount);
              }
            },
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Reps: $_reps',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: ValueListenableBuilder<PushUpFeedback?>(
              valueListenable: _feedback,
              builder: (context, feedback, _) {
                if (feedback == null) return const SizedBox.shrink();
                return PushUpFeedbackBanner(feedback: feedback);
              },
            ),
          ),
        ],
      ),
    );
  }
}