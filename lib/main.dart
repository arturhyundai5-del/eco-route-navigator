import 'package:flutter/material.dart';
// Если файл лежит в той же папке lib, ошибка исчезнет после создания файла
import 'screens/profile_screen.dart';


void main() {
  runApp(const EcoRouteApp());
}

// ЭТОТ КЛАСС ДОЛЖЕН БЫТЬ ОБЯЗАТЕЛЬНО
class EcoRouteApp extends StatelessWidget {
  const EcoRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoRoute 2026',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController fromController = TextEditingController(text: "Москва");
  final TextEditingController toController = TextEditingController(text: "Парк Горького");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoRoute"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text("Главный экран")),
    );
  }
}
