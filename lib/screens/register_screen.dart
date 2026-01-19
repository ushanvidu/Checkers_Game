import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'home_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirm = _confirmController.text.trim();

      if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
        setState(() => _errorMessage = 'Please fill all fields.');
        return;
      }
      if (password.length < 6) {
        setState(() => _errorMessage = 'Password must be at least 6 characters.');
        return;
      }
      if (password != confirm) {
        setState(() => _errorMessage = 'Passwords do not match.');
        return;
      }

      final userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user to Realtime Database
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/${userCred.user!.uid}");
      await ref.set({
        "email": email,
        "uid": userCred.user!.uid,
        // Add other fields as needed
      });
      // log success
      debugPrint('Registered user: ${userCred.user?.uid}');
      if (!mounted) return;
      // navigate to home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    } on FirebaseAuthException catch (e, st) {
      debugPrint('FirebaseAuthException: ${e.code} ${e.message}\n$st');
      setState(() => _errorMessage = '(${e.code}) ${e.message}');
    } catch (e, st) {
      debugPrint('Register error: $e\n$st');
      setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmController,
              decoration: const InputDecoration(labelText: 'Confirm password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                onPressed: _register,
                child: const Text('Create account'),
                ),
          ],
        ),
      ),
    );
  }
}
