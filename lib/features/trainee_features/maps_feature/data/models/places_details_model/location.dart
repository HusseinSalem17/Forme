class LocationModel {
  double? lat;
  double? lng;

  LocationModel({this.lat, this.lng});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
