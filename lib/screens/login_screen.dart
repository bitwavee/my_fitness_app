import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/isar_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  final IsarService isarService;

  const LoginScreen({super.key, required this.isarService});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AuthService _authService;
  String? _message;

  @override
  void initState() {
    super.initState();
    _authService = AuthService(widget.isarService);
  }

  Future<void> _register() async {
    final success = await _authService.register(
      _usernameController.text.trim(),
      _passwordController.text,
    );
    setState(() {
      _message = success ? 'Registered successfully' : 'Username already exists';
    });
  }

Future<void> _login() async {
  final user = await _authService.login(
    _usernameController.text.trim(),
    _passwordController.text,
  );

  setState(() {
    _message = user != null ? 'Login successful' : 'Invalid credentials';
  });

  if (user != null && mounted) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomeScreen(isarService: widget.isarService),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _register,
                    child: const Text('Register'),
                  ),
                ),
              ],
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