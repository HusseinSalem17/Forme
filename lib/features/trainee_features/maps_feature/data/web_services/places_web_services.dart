import 'package:dio/dio.dart';

import '../../../../../core/secrets_api_keys/secrets_api_keys.dart';



class PlacesWebservices {
  late Dio dio;

  PlacesWebservices() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(
    String place,
    String sessionToken,
  ) async {
    try {
      Response response = await dio.get(
        SecretsApiKeys.suggestionsBaseUrl,
        queryParameters: {
          'input': place,
          'types': 'address',
          'components': 'country:eg',
          'key': SecretsApiKeys.suggestionsBaseUrl,
          'sessiontoken': sessionToken,
        },
      );
      return response.data['predictions'];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
