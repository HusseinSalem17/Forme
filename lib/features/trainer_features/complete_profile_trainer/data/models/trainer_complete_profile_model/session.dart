import 'availability.dart';
import 'package.dart';

class Session {
  int? id;
  List<Package>? package;
  int? duration;
  String? targetGender;
  int? minAge;
  int? maxAge;
  bool? updateBodyMeasure;
  bool? updatePrefLifestyle;
  bool? attachBodyImg;
  bool? attachMedReport;
  List<Availability>? availability;
  String? createdAt;
  String? updatedAt;

  Session({
    this.id,
    this.package,
    this.duration,
    this.targetGender,
    this.minAge,
    this.maxAge,
    this.updateBodyMeasure,
    this.updatePrefLifestyle,
    this.attachBodyImg,
    this.attachMedReport,
    this.availability,
    this.createdAt,
    this.updatedAt,
  });

  factory Session.fromJson(
      Map<String, dynamic> json) {
    return Session(
      id: json['id'] as int?,
      package: (json['package'] as List<dynamic>?)
          ?.map((e) => Package
              .fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as int?,
      targetGender: json['target_gender'] as String?,
      minAge: json['min_age'] as int?,
      maxAge: json['max_age'] as int?,
      updateBodyMeasure: json['update_body_measure'] as bool?,
      updatePrefLifestyle: json['update_pref_lifestyle'] as bool?,
      attachBodyImg: json['attach_body_img'] as bool?,
      attachMedReport: json['attach_med_report'] as bool?,
      availability: (json['availability'] as List<dynamic>?)
          ?.map((e) => Availability
              .fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
