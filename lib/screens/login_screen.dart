import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/hash.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final login = _loginController.text.trim();
    final passwordHash = hashPassword(_passwordController.text);

    if (!prefs.containsKey(login)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный логин')),
      );
      return;
    }

    final savedHash = prefs.getString(login);
    if (savedHash != passwordHash) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный пароль')),
      );
      return;
    }

    Navigator.pushReplacementNamed(context, '/ecoRouteNavigator');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _loginController, decoration: const InputDecoration(labelText: 'Логин')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Пароль'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Войти')),
          ],
        ),
      ),
    );
  }
}
