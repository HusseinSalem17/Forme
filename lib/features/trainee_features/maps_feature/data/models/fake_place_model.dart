import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({
    required this.id,
    required this.name,
    required this.latLng,
  });
}

List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    name: 'حديقة المسلة',
    latLng: const LatLng(31.267538323618616, 32.3039531109832),
  ),
  PlaceModel(
    id: 2,
    name: 'صيدلية العزبي',
    latLng: const LatLng(31.26685053323567, 32.30529421537158),
  ),
  PlaceModel(
    id: 3,
    name: 'سينما مصر',
    latLng: const LatLng(31.267318231255377, 32.29540222875307),
  ),
  PlaceModel(
    id: 4,
    name: 'علوش البازار فرع الصباح',
    latLng: const LatLng(31.259113689875385, 32.29288982322294),
  ),
];
