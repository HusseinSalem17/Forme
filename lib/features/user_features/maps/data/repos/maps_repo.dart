import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';

abstract class MapsRepository {
  Future<Either<Failure, List<dynamic>>> fetchPlacesSuggestions(
    String place,
    String sessionToken,
  );
}
