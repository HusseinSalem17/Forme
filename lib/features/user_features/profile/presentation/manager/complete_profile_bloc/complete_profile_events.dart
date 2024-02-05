abstract class CompleteProfileEvent {
  const CompleteProfileEvent();
}

//Name, Photo, Gender, Phone, Country
class NameEvent extends CompleteProfileEvent {
  final String name;
  const NameEvent({required this.name});
}

class PhotoEvent extends CompleteProfileEvent {
  final String photo;
  const PhotoEvent({required this.photo});
}

class PhoneEvent extends CompleteProfileEvent {
  final String phone;
  const PhoneEvent({required this.phone});
}

class GenderEvent extends CompleteProfileEvent {
  final String gender;
  const GenderEvent({required this.gender});
}

class CountryEvent extends CompleteProfileEvent {
  final String country;
  const CountryEvent({required this.country});
}
