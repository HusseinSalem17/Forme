class CompleteProfileState {
  final String name;
  final String photo;
  final String phone;
  final String gender;
  final String country;

  const CompleteProfileState({
    this.name = '',
    this.photo = '',
    this.phone = '',
    this.gender = '',
    this.country = '',
  });

  // Takes the values and changes it
  CompleteProfileState copyWith({
    String? name,
    String? photo,
    String? phone,
    String? gender,
    String? country,
  }) {
    return CompleteProfileState(
      name: name ?? this.name,
      photo: photo ?? this.photo,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
    );
  }
}
