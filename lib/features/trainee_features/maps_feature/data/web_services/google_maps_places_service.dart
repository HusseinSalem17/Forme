import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/place_autocomplete_model/place_autocomplete_model.dart';
import '../models/places_details_model/places_details_model.dart';


class PlacesService {
  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  final String apiKey = 'AIzaSyA7oGbrXCoucWZc5P2vgYoii1hL22QWsqM';

  Future<List<PlaceAutocompleteModel>> getPredictions({
    required String input,
    required String sessionToken,
  }) async {
    var response = await http.get(Uri.parse(
        '$baseUrl/autocomplete/json?key=$apiKey&input=$input&sessiontoken=$sessionToken'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['predictions'];
      List<PlaceAutocompleteModel> places = [];
      for (var item in data) {
        places.add(PlaceAutocompleteModel.fromJson(item));
      }
      print(places.length);
      return places;
    } else {
      throw Exception();
    }
  }

  Future<PlacesDetailsModel> getPlaceDetails({required String placeId}) async {
    var response = await http
        .get(Uri.parse('$baseUrl/details/json?key=$apiKey&place_id=$placeId'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];

      return PlacesDetailsModel.fromJson(data);
    } else {
      throw Exception();
    }
  }
}
