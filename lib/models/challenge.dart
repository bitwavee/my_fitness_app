import 'package:isar/isar.dart';

part 'challenge.g.dart';

@collection
class Challenge {
  Id id = Isar.autoIncrement;

  late String exerciseType;
  late int targetReps;
  int? timeLimitSeconds;
  int completedReps = 0;
  late String status; // "pending", "completed", "failed"
  DateTime createdAt = DateTime.now();
  DateTime? completedAt;
}