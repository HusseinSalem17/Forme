class User {
  final int id;
  final String username;
  final String email;
  final String? dateOfBirth;
  final String? profilePicture;
  final String country;
  final String gender;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.dateOfBirth,
    this.profilePicture,
    required this.country,
    required this.gender,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      dateOfBirth: json['date_of_birth'],
      profilePicture: json['profile_picture'],
      country: json['country'] ?? '',
      gender: json['gender'] ?? '',
      phoneNumber: json['phone_number'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'date_of_birth': dateOfBirth,
      'profile_picture': profilePicture,
      'country': country,
      'gender': gender,
      'phone_number': phoneNumber,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
