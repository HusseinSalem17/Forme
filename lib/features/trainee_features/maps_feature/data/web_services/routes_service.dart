import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/location_info_model/location_info.dart';
import '../models/routes_model/routes_model.dart';
import '../models/routes_modifiers.dart';



class RoutesService {
  final String baseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';
  final String apikey = 'AIzaSyA7oGbrXCoucWZc5P2vgYoii1hL22QWsqM';

  Future<RoutesModel> fetchRoutes({
    required LocationInfoModel origin,
    required LocationInfoModel destination,
    RoutesModifiers? routesModifiers,
  }) async {
    Uri url = Uri.parse(baseUrl);
    Map<String, String> headers = {
      'Content-Type': ' application/json',
      'X-Goog-Api-Key': apikey,
      'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
    };
    Map<String, dynamic> body = {
      "origin": origin.toJson(),
      "destination": destination.toJson(),
      "travelMode": "DRIVE",
      "routingPreference": "TRAFFIC_AWARE",
      "computeAlternativeRoutes": false,
      "routeModifiers": routesModifiers != null
          ? routesModifiers.toJson()
          : RoutesModifiers().toJson(),
    };
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return RoutesModel.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      throw Exception('No Routes Found');
    }
  }
}
