


import '../models/places_suggestoins.dart';
import '../web_services/places_web_services.dart';

class MapsRepository {
  final PlacesWebservices placesWebservices;

  MapsRepository(this.placesWebservices);

  Future<List<dynamic>> fetchSuggestions(
      String place,
      String sessionToken,
      ) async {
    final suggestions = await placesWebservices.fetchSuggestions(
      place,
      sessionToken,
    );
    return suggestions
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }
}
