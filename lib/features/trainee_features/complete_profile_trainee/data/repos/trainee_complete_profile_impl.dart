// import 'package:dartz/dartz.dart';
// import 'package:forme_app/features/trainer_features/complete_profile_trainer/data/models/trainer_complete_profile_data.dart';
// import 'package:forme_app/features/trainer_features/complete_profile_trainer/data/repos/trainer_complete_profile_repo.dart';

// import '../../../../../core/errors/failures.dart';
// import '../../../../../core/widgets/flutter_toast.dart';

// class TrainerCompleteProfileRepoImpl implements TrainerCompleteProfileRepo {
//   const TrainerCompleteProfileRepoImpl();
//   @override
//   Either<Failure, String> handleTraineeCompleteProfile(
//       {required TraineeCompleteProfileData data}) {
//     try {
//       String name = data.name;
//       String? photo = data.photo;
//       String phone = data.phone;
//       String gender = data.gender;
//       String country = data.country;
//       if (name.isEmpty) {
//         toastInfo(msg: data.name);
//         return left(ServerFailure(data.name));
//       }
//       if (gender.isEmpty) {
//         toastInfo(msg: data.gender);
//         return left(ServerFailure(data.name));
//       }
//       if (country.isEmpty) {
//         toastInfo(msg: data.country);
//         return left(ServerFailure(data.name));
//       }
//       return right('success');
//     } on Exception catch (e) {
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
