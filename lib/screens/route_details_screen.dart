import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/directions_service.dart';

class RouteDetailsScreen extends StatefulWidget {
  final String from;
  final String to;
  final String transport;

  const RouteDetailsScreen({
    super.key,
    required this.from,
    required this.to,
    required this.transport,
  });

  @override
  State<RouteDetailsScreen> createState() => _RouteDetailsScreenState();
}

class _RouteDetailsScreenState extends State<RouteDetailsScreen> {
  List<Map<String, String>> steps = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadRoute();
  }

  Future<void> _loadRoute() async {
    final service = DirectionsService("YOUR_GOOGLE_API_KEY");

    final mode = widget.transport == "bike"
        ? "bicycling"
        : widget.transport == "walk"
            ? "walking"
            : widget.transport == "bus"
                ? "transit"
                : "driving";

    try {
      final routeSteps =
          await service.getRouteSteps(widget.from, widget.to, mode);
      setState(() {
        steps = routeSteps;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка: $e")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("Детали маршрута")),
    body: Column(
      children: [
        Text("Откуда: ${widget.from}"),
        Text("Куда: ${widget.to}"),
        Text("Транспорт: ${widget.transport}"),
        // здесь можно вызвать API и показать шаги маршрута
      ],
    ),
  );
}
}
