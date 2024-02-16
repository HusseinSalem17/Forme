abstract class TrainerCompleteProfileEvent {
  const TrainerCompleteProfileEvent();
}

//Name, Photo, Gender, Phone, Country, SportField
class NameEvent extends TrainerCompleteProfileEvent {
  final String name;
  const NameEvent({required this.name});
}

class PhotoEvent extends TrainerCompleteProfileEvent {
  final String photo;
  const PhotoEvent({required this.photo});
}

class PhoneEvent extends TrainerCompleteProfileEvent {
  final String phone;
  const PhoneEvent({required this.phone});
}

class GenderEvent extends TrainerCompleteProfileEvent {
  final String gender;
  const GenderEvent({required this.gender});
}

class CountryEvent extends TrainerCompleteProfileEvent {
  final String country;
  const CountryEvent({required this.country});
}

class SportFieldEvent extends TrainerCompleteProfileEvent {
  final String sportField;
  const SportFieldEvent({required this.sportField});
}
