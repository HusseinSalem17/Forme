import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:forme_app/features/trainee_features/maps_feature/data/web_services/routes_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/location_info_model/lat_lng.dart';
import '../models/location_info_model/location_info.dart';
import '../models/location_info_model/location_model.dart';
import '../models/place_autocomplete_model/place_autocomplete_model.dart';
import '../models/places_details_model/places_details_model.dart';
import '../models/routes_model/routes_model.dart';
import 'google_maps_places_service.dart';
import 'location_service.dart';


class MapServices {
  PlacesService placesService = PlacesService();
  LocationService locationService = LocationService();
  RoutesService routesService = RoutesService();
  LatLng? myCurrentLocation;

  Future<void> getPredictions({
    required String input,
    required String sessionToken,
    required List<PlaceAutocompleteModel> places,
  }) async {
    if (input.isNotEmpty) {
      List<PlaceAutocompleteModel> result = await placesService.getPredictions(
        input: input,
        sessionToken: sessionToken,
      );

      places.clear();
      places.addAll(result);
    } else {
      places.clear();
    }
  }

  Future<List<LatLng>> getRouteData({

    required LatLng myDestination,
  }) async {
    LocationInfoModel origin = LocationInfoModel(
      location: LocationModel(
          latLng: LatLngModel(
        latitude: myCurrentLocation!.latitude,
        longitude: myCurrentLocation!.longitude,
      )),
    );
    LocationInfoModel destination = LocationInfoModel(
      location: LocationModel(
          latLng: LatLngModel(
        latitude: myDestination.latitude,
        longitude: myDestination.longitude,
      )),
    );
    RoutesModel routes = await routesService.fetchRoutes(
      origin: origin,
      destination: destination,
    );
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> points = getDecodedRoute(
      polylinePoints,
      routes,
    );
    return points;
  }

  List<LatLng> getDecodedRoute(
    PolylinePoints polylinePoints,
    RoutesModel routes,
  ) {
    List<PointLatLng> result = polylinePoints.decodePolyline(
      routes.routes!.first.polyline!.encodedPolyline!,
    );
    List<LatLng> points =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }

  void displayRoute(
    List<LatLng> points, {
    required Set<Polyline> polyLines,
    required GoogleMapController googleMapController,
  }) {
    Polyline route = Polyline(
      color: Colors.red,
      width: 5,
      polylineId: const PolylineId('route'),
      points: points,
    );
    polyLines.add(route);

    /// to get southwest you should get the min lat and lng
    /// to get northeast you should get the max lat and lng
    /// so lest create function to calculate this
    LatLngBounds bounds = getLatLngBounds(points);
    googleMapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        bounds,
        32,
      ),
    );
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    var southWestLatitude = points.first.latitude;
    var southWestLongitude = points.first.longitude;
    var northEastLatitude = points.first.latitude;
    var northEastLongitude = points.first.longitude;
    for (var point in points) {
      southWestLatitude = min(southWestLatitude, point.latitude);
      southWestLongitude = min(southWestLongitude, point.longitude);

      northEastLatitude = max(northEastLatitude, point.latitude);
      northEastLongitude = max(northEastLongitude, point.longitude);
    }
    return LatLngBounds(
      southwest: LatLng(southWestLatitude, southWestLongitude),
      northeast: LatLng(northEastLatitude, northEastLongitude),
    );
  }

  void updateCurrentLocation({
    required GoogleMapController googleMapController,
    required Set<Marker> markers,
    required Function onUpdateCurrentLocation,
  }) {
    locationService.getRealtimeLocationData((locationData) {
      myCurrentLocation = LatLng(
        locationData.latitude!,
        locationData.longitude!,
      );
      Marker currentLocationMarker = Marker(
        markerId: const MarkerId('myPosition'),
        position: myCurrentLocation!,
      );
      CameraPosition myCurrentCameraPosition = CameraPosition(
        target: myCurrentLocation!,
        zoom: 16,
      );
      googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(myCurrentCameraPosition));
      markers.add(currentLocationMarker);
      onUpdateCurrentLocation();
    });
  }

  Future<PlacesDetailsModel> getPlaceDetails({
    required String placeId,
  }) async {
    return await placesService.getPlaceDetails(
      placeId: placeId,
    );
  }
}
