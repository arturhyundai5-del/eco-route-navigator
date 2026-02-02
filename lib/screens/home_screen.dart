import 'package:flutter/material.dart';
<<<<<<< HEAD

// 1. ПРОВЕРЬТЕ ПУТЬ: файл должен лежать в lib/screens/profile_screen.dart
// Если файл лежит в той же папке, что и этот, удалите 'screens/' из пути.
import 'profile_screen.dart';
import 'screens/route_details_screen.dart';

void main() {
  runApp(const EcoRouteApp());
}

class EcoRouteApp extends StatelessWidget {
  const EcoRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoRoute',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
=======
import 'profile_screen.dart';
import 'route_details_screen.dart';
import '../utils/eco.dart'; // ✅ импортируем функции экологии
>>>>>>> 6f2175e (New commit: EcoRoute project)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController fromController =
<<<<<<< HEAD
  TextEditingController(text: "Москва, Красная площадь");
  final TextEditingController toController =
  TextEditingController(text: "Москва, Парк Горького");

  String? selectedTransport;

  final transportOptions = [
    {'id': 'bike', 'name': 'Велосипед', 'icon': '🚴', 'co2': '0 г CO₂'},
    {'id': 'walk', 'name': 'Пешком', 'icon': '🚶', 'co2': '0 г CO₂'},
    {'id': 'bus', 'name': 'Автобус', 'icon': '🚌', 'co2': '40 г CO₂'},
    {'id': 'car', 'name': 'Авто', 'icon': '🚗', 'co2': '120 г CO₂'},
  ];

  void _onSearchRoute() {
  if (selectedTransport == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Выберите транспорт")),
    );
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RouteDetailsScreen(
        from: fromController.text,
        to: toController.text,
        transport: selectedTransport!,
      ),
    ),
  );
}


=======
      TextEditingController(text: "Москва, Красная площадь");
  final TextEditingController toController =
      TextEditingController(text: "Москва, Парк Горького");

  String? selectedTransport;
  int? ecoPoints;
  double? co2;

  final transportOptions = [
    {'id': 'bicycling', 'name': 'Велосипед', 'icon': '🚴'},
    {'id': 'walking', 'name': 'Пешком', 'icon': '🚶'},
    {'id': 'transit', 'name': 'Автобус', 'icon': '🚌'},
    {'id': 'driving', 'name': 'Авто', 'icon': '🚗'},
  ];

  void _onSearchRoute() {
    if (selectedTransport == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Выберите транспорт")),
      );
      return;
    }

    // ⚡ считаем эко‑баллы и CO₂ для примера (пусть расстояние 5 км)
    ecoPoints = calculateEcoPoints(selectedTransport!, 5.0);
    co2 = calculateCO2(selectedTransport!, 5.0);

    print("Эко-баллы: $ecoPoints, CO₂: $co2 г");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RouteDetailsScreen(
          from: fromController.text,
          to: toController.text,
          transport: selectedTransport!,
        ),
      ),
    );
  }

  void _onNavigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }
>>>>>>> 6f2175e (New commit: EcoRoute project)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text("EcoRoute"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _onNavigateToProfile,
            icon: const Icon(Icons.person, color: Colors.green),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
<<<<<<< HEAD
            const Text(
              "Планируйте экологичные маршруты",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

=======
            const Text("Планируйте экологичные маршруты",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
>>>>>>> 6f2175e (New commit: EcoRoute project)
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextField(
                      controller: fromController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_on, color: Colors.green),
                        labelText: "Откуда",
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: toController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.navigation, color: Colors.green),
                        labelText: "Куда",
                      ),
                    ),
                  ],
                ),
              ),
            ),
<<<<<<< HEAD

            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Выберите транспорт",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),

=======
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Выберите транспорт",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(height: 8),
>>>>>>> 6f2175e (New commit: EcoRoute project)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: transportOptions.map((option) {
                  final isSelected = selectedTransport == option['id'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTransport = option['id'] as String;
<<<<<<< HEAD
=======
                        // ⚡ сразу считаем показатели при выборе
                        ecoPoints = calculateEcoPoints(selectedTransport!, 5.0);
                        co2 = calculateCO2(selectedTransport!, 5.0);
>>>>>>> 6f2175e (New commit: EcoRoute project)
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: isSelected ? Colors.green : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: isSelected ? 6 : 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
<<<<<<< HEAD
                          Text(option['icon']!, style: const TextStyle(fontSize: 28)),
                          const SizedBox(height: 8),
                          Text(option['name']!,
                              style: const TextStyle(fontWeight: FontWeight.w500)),
                          Text(option['co2']!,
                              style: const TextStyle(color: Colors.green, fontSize: 12)),
=======
                          Text(option['icon']!,
                              style: const TextStyle(fontSize: 28)),
                          const SizedBox(height: 8),
                          Text(option['name']!,
                              style: const TextStyle(fontWeight: FontWeight.w500)),
                          if (ecoPoints != null && co2 != null && isSelected)
                            Text("Эко: $ecoPoints, CO₂: ${co2!.toStringAsFixed(1)} г",
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 12)),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
<<<<<<< HEAD

            // Кнопки управления
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _onSearchRoute,
                    icon: const Icon(Icons.navigation),
                    label: const Text("Найти маршрут"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: _onNavigateToProfile,
                  icon: const Icon(Icons.account_circle),
                  label: const Text("Перейти в профиль"),
                ),
              ],
=======
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _onSearchRoute,
                icon: const Icon(Icons.navigation),
                label: const Text("Найти маршрут"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
>>>>>>> 6f2175e (New commit: EcoRoute project)
            ),
          ],
        ),
      ),
    );
  }
}
