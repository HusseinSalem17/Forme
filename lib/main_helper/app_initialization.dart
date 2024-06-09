import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/core/utils/functions/service_locator.dart';

import 'package:forme_app/local_storage_data/auth_local/tokens.dart';

import '../local_storage_data/auth_local/user_type.dart';

Future<void> initializeApp() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
}

Future<UserType?> getInitialUserType() async {
  // Retrieve the saved user type from local storage
  UserType? initialUserType = await RegistrationDataLocal.getUserType();

  // Check if tokens are null
  String? accessToken = await UserTokenLocal.getAccessToken();
  String? refreshToken = await UserTokenLocal.getRefreshToken();

  if (accessToken == null || refreshToken == null || initialUserType == null) {
    // Tokens are null, navigate to the authentication flow
    print('Access token, refresh token, or user type is null');
    return null;
  } else {
    // Tokens exist, navigate to the main app flow
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    return initialUserType;
  }
}
