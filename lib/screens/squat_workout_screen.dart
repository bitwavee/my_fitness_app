import 'package:flutter/material.dart';
import 'package:live_pose_detector/live_pose_detector.dart';
import '../services/isar_service.dart';

class SquatWorkoutScreen extends StatefulWidget {
  final IsarService isarService;

  const SquatWorkoutScreen({super.key, required this.isarService});

  @override
  State<SquatWorkoutScreen> createState() => _SquatWorkoutScreenState();
}

class _SquatWorkoutScreenState extends State<SquatWorkoutScreen> {
  int _reps = 0;
  bool _wentDown = false;
  String _feedback = 'Stand sideways and squat';

  // Track the lowest ankle position seen (ground level)
  double? _groundLevel;
  static const double _maxFootLift = 80; // pixels — tune if needed

  void _processPose(List<Pose> poses) {
  if (poses.isEmpty) {
    setState(() => _feedback = 'No person detected');
    return;
  }

  final pose = poses.first;

  final leftHip = pose.landmarks[PoseLandmarkType.leftHip];
  final leftKnee = pose.landmarks[PoseLandmarkType.leftKnee];
  final leftAnkle = pose.landmarks[PoseLandmarkType.leftAnkle];
  final rightHip = pose.landmarks[PoseLandmarkType.rightHip];
  final rightKnee = pose.landmarks[PoseLandmarkType.rightKnee];
  final rightAnkle = pose.landmarks[PoseLandmarkType.rightAnkle];

  bool isVisible(PoseLandmark? landmark) {
    return landmark != null && landmark.likelihood > 0.5;
  }

  if (!isVisible(leftHip) || !isVisible(leftKnee) || !isVisible(leftAnkle) ||
      !isVisible(rightHip) || !isVisible(rightKnee) || !isVisible(rightAnkle)) {
    setState(() => _feedback = 'Show full legs in frame');
    _wentDown = false;
    return;
  }

  final leftAngle = angleBetweenLandmarks(leftHip!, leftKnee!, leftAnkle!);
  final rightAngle = angleBetweenLandmarks(rightHip!, rightKnee!, rightAnkle!);
  final kneeAngle = leftAngle < rightAngle ? leftAngle : rightAngle;

  final avgAnkleY = (leftAnkle!.y + rightAnkle!.y) / 2;

  // Only update ground level when standing fairly upright
  if (kneeAngle > 120) {
    if (_groundLevel == null || avgAnkleY > _groundLevel!) {
      _groundLevel = avgAnkleY;
    }
  }

  final footLift = (_groundLevel ?? avgAnkleY) - avgAnkleY;

  const double downThreshold = 100;
  const double upThreshold = 150;
  const double maxFootLift = 100; // more forgiving

  // Only block if feet clearly left the floor
  if (footLift > maxFootLift) {
    setState(() => _feedback = 'Feet left the floor');
    _wentDown = false;
    return;
  }

  if (kneeAngle < downThreshold && !_wentDown) {
    _wentDown = true;
    setState(() => _feedback = 'Down');
  } else if (kneeAngle > upThreshold && _wentDown) {
    _wentDown = false;
    _reps++;
    setState(() => _feedback = 'Rep counted!');
  } else if (_wentDown) {
    setState(() => _feedback = 'Coming up (${kneeAngle.toStringAsFixed(0)}°)');
  } else {
    setState(() => _feedback = 'Ready (${kneeAngle.toStringAsFixed(0)}°)');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Squat Counter')),
      body: Stack(
        children: [
          CameraPoseView(
            onPosesDetected: _processPose,
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
                child: Column(
                  children: [
                    Text(
                      'Reps: $_reps',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _feedback,
                      style: const TextStyle(color: Colors.white70, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
