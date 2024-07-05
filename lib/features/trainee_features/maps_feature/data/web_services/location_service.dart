
import 'package:location/location.dart';
class LocationService {
  Location location = Location();


  Future<void> checkAndRequestLocationService() async {
    try {
      bool isLocationServiceEnabled = await location.serviceEnabled();
      if (!isLocationServiceEnabled) {
        isLocationServiceEnabled = await location.requestService();
        if (!isLocationServiceEnabled) {
          throw LocationServiceException();
        }
      }
    } catch (e) {
      // Handle LocationServiceException
      throw LocationServiceException();
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    try {
      var permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.deniedForever) {
        throw LocationPermissionException();
      }
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await location.requestPermission();
        if (permissionStatus != PermissionStatus.granted) {
          throw LocationPermissionException();
        }
      }
    } catch (e) {
      // Handle LocationPermissionException
      throw LocationPermissionException();
    }
  }

  /// this function is used if i need to tracking user location only
  void getRealtimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
