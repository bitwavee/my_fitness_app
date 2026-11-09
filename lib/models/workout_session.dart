import 'package:isar/isar.dart';

part 'workout_session.g.dart';

@collection
class WorkoutSession {
  Id id = Isar.autoIncrement;

  late String exerciseType;
  late int reps;
  int? durationSeconds;
  DateTime date = DateTime.now();
  double? formQuality;
}