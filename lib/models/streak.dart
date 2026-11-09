import 'package:isar/isar.dart';

part 'streak.g.dart';

@collection
class Streak {
  Id id = Isar.autoIncrement;

  int currentStreak = 0;
  int longestStreak = 0;
  DateTime? lastActiveDate;
}