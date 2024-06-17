class TraineeCompleteProfileDataModel {
  final String username;
  final String country;
  final String? profilePicture;
  final String? phoneNumber;
  final String gender;

  TraineeCompleteProfileDataModel({
    required this.username,
    required this.country,
    this.profilePicture,
    this.phoneNumber,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'country': country,
      'profile_picture': profilePicture ?? "",
      'phone_number': phoneNumber,
      'gender': gender,
    };
  }

  factory TraineeCompleteProfileDataModel.fromJson(Map<String, dynamic> json) {
    return TraineeCompleteProfileDataModel(
      username: json['username'],
      country: json['country'],
      profilePicture: json['profile_picture'],
      phoneNumber: json['phone_number'],
      gender: json['gender'],
    );
  }
}
