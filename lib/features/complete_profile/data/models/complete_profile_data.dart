class CompleteProfileData {
  final String name;
  final String? photo;
  final String phone;
  final String gender;
  final String country;

  const CompleteProfileData({
    required this.name,
    this.photo,
    required this.phone,
    required this.gender,
    required this.country,
  });
}
