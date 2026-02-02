import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsService {
  final String apiKey;
  final String? proxyUrl;

  DirectionsService(this.apiKey, {this.proxyUrl});

  /// Получаем шаги маршрута
  Future<List<Map<String, String>>> getRouteSteps(
      String origin, String destination, String mode) async {
    final url =
        '${proxyUrl ?? ''}/maps/api/directions/json?origin=$origin&destination=$destination&mode=$mode&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    final steps = <Map<String, String>>[];
    if (data['routes'].isNotEmpty) {
      final legs = data['routes'][0]['legs'];
      for (var leg in legs) {
        for (var step in leg['steps']) {
          steps.add({
            'instruction': step['html_instructions'],
            'distance': step['distance']['text'],
          });
        }
      }
    }
    return steps;
  }

  /// Получаем полилинию маршрута
  Future<List<LatLng>> getRoutePolyline(
      String origin, String destination, String mode) async {
    final url =
        '${proxyUrl ?? ''}/maps/api/directions/json?origin=$origin&destination=$destination&mode=$mode&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    final points = <LatLng>[];
    if (data['routes'].isNotEmpty) {
      final polyline = data['routes'][0]['overview_polyline']['points'];
      points.addAll(_decodePolyline(polyline));
    }
    return points;
  }

  /// Новый метод: получаем расстояние маршрута в км
  Future<double> getRouteDistance(
      String origin, String destination, String mode) async {
    final url =
        '${proxyUrl ?? ''}/maps/api/directions/json?origin=$origin&destination=$destination&mode=$mode&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (data['routes'].isNotEmpty) {
      final legs = data['routes'][0]['legs'];
      double totalMeters = 0;
      for (var leg in legs) {
        totalMeters += leg['distance']['value']; // значение в метрах
      }
      return totalMeters / 1000.0; // переводим в километры
    }
    return 0.0;
  }

  /// Декодируем полилинию Google Maps
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      polyline.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return polyline;
  }
}
