import 'package:flutter/material.dart';

class EcoRouteNavigatorScreen extends StatelessWidget {
  const EcoRouteNavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eco Route Navigator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Добро пожаловать в Eco Route Navigator!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Перейти к маршрутам'),
            ),
          ],
        ),
      ),
    );
  }
}
