import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../models/user.dart';
import 'isar_service.dart';

class AuthService {
  final IsarService isarService;

  AuthService(this.isarService);

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }

  Future<bool> register(String username, String password) async {
    final existing = await isarService.getUserByUsername(username);
    if (existing != null) return false; // username taken

    final user = User()
      ..username = username
      ..passwordHash = _hashPassword(password);

    await isarService.saveUser(user);
    return true;
  }

  Future<User?> login(String username, String password) async {
    final user = await isarService.getUserByUsername(username);
    if (user == null) return null;

    final hashed = _hashPassword(password);
    if (user.passwordHash == hashed) {
      return user;
    }
    return null;
  }
}