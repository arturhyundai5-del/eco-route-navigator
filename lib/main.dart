import 'package:flutter/material.dart';
<<<<<<< HEAD
// Если файл лежит в той же папке lib, ошибка исчезнет после создания файла
import 'screens/profile_screen.dart';

=======
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/route_details_screen.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/eco_route_navigator_screen.dart';
>>>>>>> 6f2175e (New commit: EcoRoute project)

void main() {
  runApp(const EcoRouteApp());
}

<<<<<<< HEAD
// ЭТОТ КЛАСС ДОЛЖЕН БЫТЬ ОБЯЗАТЕЛЬНО
=======
>>>>>>> 6f2175e (New commit: EcoRoute project)
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
<<<<<<< HEAD
      home: const HomeScreen(),
=======
      // начальный экран — регистрация
      initialRoute: '/register',
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/ecoRouteNavigator': (context) => EcoRouteNavigatorScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
>>>>>>> 6f2175e (New commit: EcoRoute project)
    );
  }
}

<<<<<<< HEAD
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
=======
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController fromController =
//       TextEditingController(text: "Москва");
//   final TextEditingController toController =
//       TextEditingController(text: "Парк Горького");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("EcoRoute"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.person),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ProfileScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => RouteDetailsScreen(
//                   from: fromController.text,
//                   to: toController.text,
//                   transport: "car", // можно подставить выбранный транспорт
//                 ),
//               ),
//             );
//           },
//           child: const Text("Перейти к маршруту"),
//         ),
//       ),
//     );
//   }
// }
>>>>>>> 6f2175e (New commit: EcoRoute project)
