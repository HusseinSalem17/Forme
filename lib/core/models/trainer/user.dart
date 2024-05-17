class User {
  int? id;
  String? username;
  String? email;
  dynamic dateOfBirth;
  String? profilePicture;
  String? country;
  String? gender;
  String? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.username,
    this.email,
    this.dateOfBirth,
    this.profilePicture,
    this.country,
    this.gender,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['date_of_birth'] as dynamic,
      profilePicture: json['profile_picture'] as String?,
      country: json['country'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }
}
