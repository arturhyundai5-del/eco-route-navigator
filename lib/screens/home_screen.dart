import 'package:flutter/material.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController fromController =
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
            const Text(
              "Планируйте экологичные маршруты",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

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

            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Выберите транспорт",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),

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
                          Text(option['icon']!, style: const TextStyle(fontSize: 28)),
                          const SizedBox(height: 8),
                          Text(option['name']!,
                              style: const TextStyle(fontWeight: FontWeight.w500)),
                          Text(option['co2']!,
                              style: const TextStyle(color: Colors.green, fontSize: 12)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

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
            ),
          ],
        ),
      ),
    );
  }
}
