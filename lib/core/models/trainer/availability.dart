class Availability {
  int? id;
  String? day;
  bool? isActive;
  List<dynamic>? time;

  Availability({this.id, this.day, this.isActive, this.time});

  factory Availability.fromJson(
      Map<String, dynamic> json) {
    return Availability(
      id: json['id'] as int?,
      day: json['day'] as String?,
      isActive: json['is_active'] as bool?,
      time: json['time'] as List<dynamic>?,
    );
  }

}
