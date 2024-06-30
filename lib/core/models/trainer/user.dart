import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? email;
  @HiveField(3)
  dynamic dateOfBirth;
  @HiveField(4)
  String? profilePicture;
  @HiveField(5)
  String? country;
  @HiveField(6)
  String? gender;
  @HiveField(7)
  String? phoneNumber;
  @HiveField(8)
  DateTime? createdAt;
  @HiveField(9)
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
