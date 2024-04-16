class TrainerCompleteProfileState {
  final String name;
  final String photo;
  final String phone;
  final String gender;
  final String country;
  final String sportField;

  const TrainerCompleteProfileState({
    this.name = '',
    this.photo = '',
    this.phone = '',
    this.gender = '',
    this.country = '',
    this.sportField = '',
  });

  // Takes the values and changes it
  TrainerCompleteProfileState copyWith({
    String? name,
    String? photo,
    String? phone,
    String? gender,
    String? country,
    String? sportField,
  }) {
    return TrainerCompleteProfileState(
      name: name ?? this.name,
      photo: photo ?? this.photo,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      sportField: sportField ?? this.sportField,
    );
  }
}
