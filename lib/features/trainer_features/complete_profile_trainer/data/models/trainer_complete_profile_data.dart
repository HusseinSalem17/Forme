class TrainerCompleteProfileData {
  final String name;
  final String? photo;
  final String phone;
  final String gender;
  final String country;
  final String sportField;

  const TrainerCompleteProfileData({
    required this.name,
    this.photo,
    required this.phone,
    required this.gender,
    required this.country,
    required this.sportField,
  });
}
