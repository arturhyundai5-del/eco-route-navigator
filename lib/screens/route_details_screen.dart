import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/directions_service.dart';
<<<<<<< HEAD
=======
import '../utils/eco.dart'; // ✅ импортируем функции экологии
>>>>>>> 6f2175e (New commit: EcoRoute project)

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
<<<<<<< HEAD
=======
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  String currentTransport = "walking";
  double distanceKm = 0.0; // расстояние маршрута
  int ecoPoints = 0;
  double co2 = 0;
>>>>>>> 6f2175e (New commit: EcoRoute project)

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
=======
    currentTransport = widget.transport;
>>>>>>> 6f2175e (New commit: EcoRoute project)
    _loadRoute();
  }

  Future<void> _loadRoute() async {
<<<<<<< HEAD
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
=======
    final service = DirectionsService(
      "AIzaSyDguQzHo_YnhP9og9PM5-5GD0vLGgRYBcw", // ⚠️ вставь свой ключ Google Directions API
      proxyUrl: "http://localhost:3000",
    );

    final from = widget.from;
    final to = widget.to;

    try {
      final routeSteps = await service.getRouteSteps(from, to, currentTransport);
      final polylinePoints = await service.getRoutePolyline(from, to, currentTransport);
      final routeDistance = await service.getRouteDistance(from, to, currentTransport); 
      // ⚠️ реализуй метод getRouteDistance в DirectionsService

      if (!mounted) return;

      setState(() {
        steps = routeSteps;
        distanceKm = routeDistance;
        ecoPoints = calculateEcoPoints(currentTransport, distanceKm);
        co2 = calculateCO2(currentTransport, distanceKm);
        loading = false;

        _markers = {
          Marker(
            markerId: const MarkerId("from"),
            position: polylinePoints.first,
            infoWindow: InfoWindow(title: from),
          ),
          Marker(
            markerId: const MarkerId("to"),
            position: polylinePoints.last,
            infoWindow: InfoWindow(title: to),
          ),
        };

        _polylines = {
          Polyline(
            polylineId: const PolylineId("route"),
            color: Colors.blue,
            width: 5,
            points: polylinePoints,
          ),
        };
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: polylinePoints.first,
            northeast: polylinePoints.last,
          ),
          50,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
>>>>>>> 6f2175e (New commit: EcoRoute project)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка: $e")),
      );
    }
  }

<<<<<<< HEAD

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
=======
  void _changeTransport(String mode) {
    setState(() {
      currentTransport = mode;
      loading = true;
    });
    _loadRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Маршрут: ${widget.from} → ${widget.to}"),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  flex: 2,
                  child: GoogleMap(
                    onMapCreated: (controller) => _mapController = controller,
                    initialCameraPosition: CameraPosition(
                      target: _markers.isNotEmpty
                          ? _markers.first.position
                          : const LatLng(55.7539, 37.6208),
                      zoom: 13,
                    ),
                    markers: _markers,
                    polylines: _polylines,
                  ),
                ),
                // Панель экологии
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Расстояние: ${distanceKm.toStringAsFixed(1)} км"),
                      Text("Эко-баллы: $ecoPoints"),
                      Text("CO₂ выбросы: ${co2.toStringAsFixed(1)} г"),
                    ],
                  ),
                ),
                // Панель выбора транспорта
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 12,
                    children: [
                      ChoiceChip(
                        label: const Text("🚶 Пешком"),
                        selected: currentTransport == "walking",
                        onSelected: (_) => _changeTransport("walking"),
                      ),
                      ChoiceChip(
                        label: const Text("🚗 Авто"),
                        selected: currentTransport == "driving",
                        onSelected: (_) => _changeTransport("driving"),
                      ),
                      ChoiceChip(
                        label: const Text("🚴 Велосипед"),
                        selected: currentTransport == "bicycling",
                        onSelected: (_) => _changeTransport("bicycling"),
                      ),
                      ChoiceChip(
                        label: const Text("🚌 Автобус"),
                        selected: currentTransport == "transit",
                        onSelected: (_) => _changeTransport("transit"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: steps.length,
                    itemBuilder: (context, index) {
                      final step = steps[index];
                      return ListTile(
                        leading: const Icon(Icons.directions, color: Colors.green),
                        title: Text(step["instruction"]!),
                        subtitle: Text(step["distance"]!),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
// ⚠️ не забудь реализовать методы calculateEcoPoints и calculateCO2 в utils/eco.dart
>>>>>>> 6f2175e (New commit: EcoRoute project)
