class Workout {
  final int id;
  final String title;
  final String? picture;
  final String level;
  final String price;
  final String? offerPrice;
  final int durationInMinutes;
  final double avgRatings;
  final int numberOfRatings;
  final String createdAt;
  final String updatedAt;

  Workout({
    required this.id,
    required this.title,
    this.picture,
    required this.level,
    required this.price,
    this.offerPrice,
    required this.durationInMinutes,
    required this.avgRatings,
    required this.numberOfRatings,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      level: json['level'],
      price: json['price'],
      offerPrice: json['offer_price'],
      durationInMinutes: json['duration_in_minutes'],
      avgRatings: json['avg_ratings'],
      numberOfRatings: json['number_of_ratings'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'level': level,
      'price': price,
      'offer_price': offerPrice,
      'duration_in_minutes': durationInMinutes,
      'avg_ratings': avgRatings,
      'number_of_ratings': numberOfRatings,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}