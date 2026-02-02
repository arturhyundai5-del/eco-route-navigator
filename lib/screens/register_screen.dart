import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/hash.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
    final prefs = await SharedPreferences.getInstance();
    final login = _loginController.text;
    final passwordHash = hashPassword(_passwordController.text);

    // Проверка: существует ли логин
    if (prefs.containsKey(login)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Логин уже существует')),
      );
      return;
    }

    // Сохраняем логин и хэш пароля
    await prefs.setString(login, passwordHash);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Регистрация успешна')),
    );

    Navigator.pushReplacementNamed(context, '/login');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _loginController, decoration: InputDecoration(labelText: 'Логин')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Пароль'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text('Зарегистрироваться')),
          ],
        ),
      ),
    );
  }
}