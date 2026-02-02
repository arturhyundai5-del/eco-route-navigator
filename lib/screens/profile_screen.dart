import 'package:flutter/material.dart';
<<<<<<< HEAD

class ProfileScreen extends StatelessWidget {

=======
import '../utils/eco.dart';

class ProfileScreen extends StatelessWidget {
>>>>>>> 6f2175e (New commit: EcoRoute project)
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    final double carEmission = calculateCO2('car', 10.0); 
    final double walkEmission = calculateCO2('walking', 10.0); 
    final double savedCO2 = carEmission - walkEmission;

>>>>>>> 6f2175e (New commit: EcoRoute project)
    final achievements = [
      {'icon': '🌟', 'title': 'Первый маршрут', 'earned': true},
      {'icon': '🚴', 'title': 'Велолюбитель', 'earned': true},
      {'icon': '🌍', 'title': 'Эко-герой', 'earned': false},
      {'icon': '🏆', 'title': 'Чемпион', 'earned': false},
    ];

    final stats = [
      {'label': 'Всего маршрутов', 'value': '24', 'icon': Icons.bar_chart},
<<<<<<< HEAD
      {'label': 'CO₂ сэкономлено', 'value': '5.2 кг', 'icon': Icons.eco},
=======
      {'label': 'CO₂ сэкономлено', 'value': '${savedCO2.toStringAsFixed(1)} г', 'icon': Icons.eco},
>>>>>>> 6f2175e (New commit: EcoRoute project)
      {'label': 'Эко-баллы', 'value': '350', 'icon': Icons.emoji_events},
    ];

    return Scaffold(
<<<<<<< HEAD
=======
      appBar: AppBar(
        title: const Text("Профиль"),
        backgroundColor: Colors.green,
      ),
>>>>>>> 6f2175e (New commit: EcoRoute project)
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEFFDF4), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                color: Colors.green.shade600,
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context); // Возврат назад
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      label: const Text("Назад",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
<<<<<<< HEAD
                            color: Colors.white.withAlpha(50),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(child: Text("👤", style: TextStyle(fontSize: 32))),
=======
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text("👤", style: TextStyle(fontSize: 32)),
                          ),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Александр Иванов",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            const Text("alex.ivanov@email.com",
                                style: TextStyle(color: Colors.white70)),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
<<<<<<< HEAD
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
=======
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                              decoration: BoxDecoration(
                                color: Colors.green.shade700,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.park, size: 14, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text("Эко-путешественник",
<<<<<<< HEAD
                                      style: TextStyle(color: Colors.white, fontSize: 12)),
=======
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Stats
              Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
=======
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: stats.map((stat) {
                        return Column(
                          children: [
                            Icon(stat['icon'] as IconData, color: Colors.green),
                            const SizedBox(height: 4),
                            Text(stat['value'] as String,
                                style: const TextStyle(
<<<<<<< HEAD
                                    fontWeight: FontWeight.bold, color: Colors.black)),
                            Text(stat['label'] as String,
                                style: const TextStyle(fontSize: 12, color: Colors.grey)),
=======
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(stat['label'] as String,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              // Achievements
              Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
=======
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Достижения",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      children: achievements.map((ach) {
                        final earned = ach['earned'] as bool;
                        return Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
<<<<<<< HEAD
                            color: earned ? Colors.green.shade100 : Colors.grey.shade200,
=======
                            color: earned
                                ? Colors.green.shade100
                                : Colors.grey.shade200,
>>>>>>> 6f2175e (New commit: EcoRoute project)
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
<<<<<<< HEAD
                              Text(ach['icon'] as String, style: const TextStyle(fontSize: 20)),
                              Text(ach['title'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 10, color: Colors.black)),
=======
                              Text(ach['icon'] as String,
                                  style: const TextStyle(fontSize: 20)),
                              Text(ach['title'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black)),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              // Monthly Progress
              Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
=======
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Row(
                              children: [
                                Icon(Icons.trending_up, color: Colors.green),
                                SizedBox(width: 8),
                                Text("Экологичных поездок"),
                              ],
                            ),
                            Text("18/20",
                                style: TextStyle(
<<<<<<< HEAD
                                    color: Colors.green, fontWeight: FontWeight.bold)),
=======
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                          ],
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: 0.9,
                          color: Colors.green,
<<<<<<< HEAD
                          backgroundColor: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 8),
                        const Text("Еще 2 поездки до достижения цели!",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
=======
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        const Text("Еще 2 поездки до достижения цели!",
                            style:
                                TextStyle(fontSize: 12, color: Colors.grey)),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                      ],
                    ),
                  ),
                ),
              ),

              // Settings
              Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
=======
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Настройки",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Card(
                      child: Column(
                        children: [
                          _buildSettingRow(Icons.eco, "Приоритет экологии",
                              "Всегда выбирать эко-маршруты", true),
                          _buildSettingRow(Icons.bar_chart, "Статистика",
                              "Отслеживать эко-показатели", true),
                          _buildSettingRow(Icons.settings, "Уведомления",
                              "О новых достижениях", false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Logout Button
              Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: OutlinedButton(
                  onPressed: () {},
=======
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
>>>>>>> 6f2175e (New commit: EcoRoute project)
                  child: const Text("Выйти из аккаунта"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingRow(
      IconData icon, String title, String subtitle, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14)),
                  Text(subtitle,
<<<<<<< HEAD
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
=======
                      style:
                          const TextStyle(fontSize: 12, color: Colors.grey)),
>>>>>>> 6f2175e (New commit: EcoRoute project)
                ],
              )
            ],
          ),
          Switch(value: value, onChanged: (_) {})
        ],
      ),
    );
  }
}
<<<<<<< HEAD
=======

>>>>>>> 6f2175e (New commit: EcoRoute project)
