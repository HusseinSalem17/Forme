import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/place_autocomplete_model/place_autocomplete_model.dart';
import '../../../data/models/places_details_model/places_details_model.dart';
import '../../../data/web_services/location_service.dart';
import '../../../data/web_services/map_services.dart';
import 'custom_map_search_field.dart';
import 'custom_suggestions_list.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  static const String routeName = '/map-screen';

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late MapServices mapServices;
  late CameraPosition initialCameraPosition;

  late GoogleMapController googleMapController;
  late TextEditingController searchController;

  // final TextFieldListenerUpdate textFieldListenerUpdate =
  //     TextFieldListenerUpdate(delay: const Duration(milliseconds: 500));
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  Timer? debounce;

  List<PlaceAutocompleteModel> places = [];

  late LatLng myDestination;
  late Uuid uuid;
  String? sessionToken;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(
        31.257887239825866,
        32.29238692071138,
      ),
    );
    mapServices = MapServices();
    searchController = TextEditingController();
    fetchPredictions();
    uuid = const Uuid();

    super.initState();
  }

  void fetchPredictions() {
    searchController.addListener(
      () {
        if (debounce?.isActive ?? false) {
          debounce?.cancel();
        }
        debounce = Timer(
            const Duration(
              milliseconds: 200,
            ), () async {
          sessionToken ??= uuid.v4();
          await mapServices.getPredictions(
            input: searchController.text,
            sessionToken: sessionToken!,
            places: places,
          );
          setState(() {});
        });
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              polylines: polyLines,
              markers: markers,
              onMapCreated: (controller) {
                googleMapController = controller;
                updateCurrentLocation();
              },
              initialCameraPosition: initialCameraPosition,
              zoomControlsEnabled: false,
            ),
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  CustomMapSearchField(
                    searchController: searchController,
                  ),
                  const SizedBox(height: 16),
                  CustomSuggestionsList(
                    places: places,
                    mapServices: mapServices,
                    onPlaceSelected:
                        (PlacesDetailsModel placeDetailModel) async {
                      searchController.clear();
                      places.clear();
                      sessionToken = null;
                      setState(() {});
                      myDestination = LatLng(
                        placeDetailModel.geometry!.location!.lat!,
                        placeDetailModel.geometry!.location!.lng!,
                      );
                      var points = await mapServices.getRouteData(
                        myDestination: myDestination,
                      );
                      mapServices.displayRoute(
                        points,
                        polyLines: polyLines,
                        googleMapController: googleMapController,
                      );
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? updateCurrentLocation() {
    try {
      mapServices.updateCurrentLocation(
          googleMapController: googleMapController,
          markers: markers,
          onUpdateCurrentLocation: () {
            setState(() {});
          });
      return null; // No error occurred
    } on Exception catch (e) {
      // Handle exceptions here
      if (e is LocationServiceException) {
        // Handle LocationServiceException
        return 'Location service is not enabled or cannot be enabled.';
      } else if (e is LocationPermissionException) {
        // Handle LocationPermissionException
        return 'Location permission is not granted or cannot be granted.';
      } else {
        // Handle other exceptions
        return 'An error occurred: $e';
      }
    }
  }
}
