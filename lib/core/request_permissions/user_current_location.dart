import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position?> getCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      // Location services are not enabled, request permission to enable them
      await Geolocator.openLocationSettings();
      return null; // Return null as we cannot proceed without location services
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Location permissions are not granted, request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle accordingly (show a message or request again)
        return null; // Return null as we cannot proceed without location permissions
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle accordingly (show a message or redirect to settings)
      return null; // Return null as we cannot proceed without location permissions
    }

    // Permissions are granted, proceed to get the current location
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}