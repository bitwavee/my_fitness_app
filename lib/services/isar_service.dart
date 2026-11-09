import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';
import '../models/capacity_test.dart';
import '../models/challenge.dart';
import '../models/streak.dart';
import '../models/workout_session.dart';

class IsarService {
  late final Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        UserSchema,
        CapacityTestSchema,
        ChallengeSchema,
        StreakSchema,
        WorkoutSessionSchema,
      ],
      directory: dir.path,
    );
  }

  // ---------- User ----------
  Future<void> saveUser(User user) async {
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }

  Future<User?> getUserByUsername(String username) async {
    return await isar.users.filter().usernameEqualTo(username).findFirst();
  }

  // ---------- Capacity Test ----------
  Future<void> saveCapacityTest(CapacityTest test) async {
    await isar.writeTxn(() async {
      await isar.capacityTests.put(test);
    });
  }

  Future<List<CapacityTest>> getCapacityTests() async {
    return await isar.capacityTests.where().sortByDateDesc().findAll();
  }

  // ---------- Challenge ----------
  Future<void> saveChallenge(Challenge challenge) async {
    await isar.writeTxn(() async {
      await isar.challenges.put(challenge);
    });
  }

  Future<List<Challenge>> getChallenges() async {
    return await isar.challenges.where().sortByCreatedAtDesc().findAll();
  }

  // ---------- Streak ----------
  Future<Streak> getOrCreateStreak() async {
    final existing = await isar.streaks.where().findFirst();
    if (existing != null) return existing;

    final streak = Streak();
    await isar.writeTxn(() async {
      await isar.streaks.put(streak);
    });
    return streak;
  }

  Future<void> updateStreak(Streak streak) async {
    await isar.writeTxn(() async {
      await isar.streaks.put(streak);
    });
  }

  // ---------- Workout Session ----------
  Future<void> saveWorkoutSession(WorkoutSession session) async {
    await isar.writeTxn(() async {
      await isar.workoutSessions.put(session);
    });
  }

  Future<List<WorkoutSession>> getWorkoutSessions() async {
    return await isar.workoutSessions.where().sortByDateDesc().findAll();
  }
}