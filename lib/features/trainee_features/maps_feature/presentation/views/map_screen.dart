import 'dart:async';
import 'package:flutter/material.dart';
import 'package:forme_app/features/trainee_features/maps_feature/presentation/views/widgets/custom_floatin_search_bar.dart';
import 'package:forme_app/features/trainee_features/maps_feature/presentation/views/widgets/custom_search_delegate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/request_permissions/user_current_location.dart';
import '../../../../../core/utils/app_colors.dart';


class MapScreen extends StatefulWidget {
  static const routeName = '/map-screen';

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  Position? position;
  late CameraPosition _myCameraPositionCurrentLocation;
  bool loading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      loading = true;
      errorMessage = '';
    });

    Position? currentPosition = await LocationHelper.getCurrentLocation();

    if (currentPosition != null) {
      _myCameraPositionCurrentLocation = CameraPosition(
        target: LatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        ),
        bearing: 0.0,
        tilt: 0.0,
        zoom: 17,
      );
      setState(() {
        position = currentPosition;
      });
    } else {
      setState(() {
        errorMessage =
        'Failed to get location. Please enable location services and try again.';
      });
    }

    setState(() {
      loading = false;
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_myCameraPositionCurrentLocation),
    );
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: _myCameraPositionCurrentLocation,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Widget buildErrorMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _getCurrentLocation(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         showSearch(
      //           context: context,
      //           delegate: CustomSearchDelegate(),
      //         );
      //       },
      //       icon: const Icon(Icons.search),
      //     ),
      //   ],
      // ),

      body: Stack(
        // fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : loading
              ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          )
              : buildErrorMessage(),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: FloatingSearchBar(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => _goToMyCurrentLocation(),
        child: const Icon(
          Icons.place,
          color: Colors.white,
        ),
      ),
    );
  }
}