class Package {
  int? id;
  String? sessionType;
  bool? isActive;
  String? price;

  Package({this.id, this.sessionType, this.isActive, this.price});

  factory Package.fromJson(
      Map<String, dynamic> json) {
    return Package(
      id: json['id'] as int?,
      sessionType: json['session_type'] as String?,
      isActive: json['is_active'] as bool?,
      price: json['price'] as String?,
    );
  }
}
