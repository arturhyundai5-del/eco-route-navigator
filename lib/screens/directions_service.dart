import 'package:http/http.dart' as http;

class DirectionsService {
  final String apiKey;

  DirectionsService(this.apiKey);

  Future<List<Map<String, String>>> getRouteSteps(
      String from, String to, String mode) async {
    final url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$from&destination=$to&mode=$mode&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    final steps = data["routes"][0]["legs"][0]["steps"] as List;

    return steps.map((s) {
      return {
        "instruction": (s["html_instructions"] as String)
            .replaceAll(RegExp(r"<[^>]*>"), ""),
        "distance": s["distance"]["text"] as String,
      };
    }).toList();
  }
}
