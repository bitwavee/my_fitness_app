import 'package:isar/isar.dart';

part 'capacity_test.g.dart';

@collection
class CapacityTest {
  Id id = Isar.autoIncrement;

  late String exerciseType; // e.g. "pushups", "squats"
  late int maxReps;
  late DateTime date;
}