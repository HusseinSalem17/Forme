import 'package:dio/dio.dart';

import '../../../../../core/utils/api_end_points.dart';




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
        EndPoint.suggestionsBaseUrl,
        queryParameters: {
          'input': place,
          'types': 'address',
          'components': 'country:eg',
          'key': EndPoint.googleApiKey,
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
