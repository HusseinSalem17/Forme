import 'package:forme_app/core/user_type.dart';

class RequestRegister {
  final String email;
  final String password;
  final String userType;

  RequestRegister({
    required this.email,
    required this.password,
    required UserType userType,
  }): userType = userType.toString().split('.').last;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'user_type': userType,
    };
  }
}
