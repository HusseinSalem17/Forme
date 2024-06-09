import 'package:forme_app/core/user_type.dart';

class RequestOtp {
  final String email;
  final String userType;

  RequestOtp({
    required this.email,
    required UserType userType,
  }) : userType = userType.toString().split('.').last;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'user_type': userType,
    };
  }
}
