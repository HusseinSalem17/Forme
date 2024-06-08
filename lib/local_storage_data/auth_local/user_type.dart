import 'package:shared_preferences/shared_preferences.dart';

import '../../core/user_type.dart';

class RegistrationDataLocal {
  static const String _userTypeKey = 'user_type';

  static Future<void> saveUserType(UserType userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userTypeKey, userType.toString());
  }

  static Future<UserType?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userTypeString = prefs.getString(_userTypeKey);
    if (userTypeString != null) {
      return UserType.values
          .firstWhere((type) => type.toString() == userTypeString);
    }
    return null;
  }
  static Future<void> clearUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userTypeKey);
  }
}
