// import 'package:dartz/dartz.dart';
// import 'package:forme_app/core/errors/failures.dart';
// import 'package:forme_app/features/trainee_features/maps_feature/data/repos/maps_repo.dart';
// import '../web_services/places_web_services.dart';
//
// class MapsRepositoryImplementation extends MapsRepository {
//   final PlacesWebservices placesWebservices;
//
//   MapsRepositoryImplementation(this.placesWebservices);
//
//   @override
//   Future<Either<Failure, List>> fetchPlacesSuggestions(
//     String place,
//     String sessionToken,
//   ) async {
//     try {
//       final suggestions =
//           await placesWebservices.fetchSuggestions(place, sessionToken);
//       return right(
//         suggestions
//             .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
//             .toList(),
//       );
//     } catch (error) {
//       return left(
//         ServerFailure(
//           error.toString(),
//         ),
//       );
//     }
//   }
// }
