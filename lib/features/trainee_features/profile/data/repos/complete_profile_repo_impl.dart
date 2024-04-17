import 'package:dartz/dartz.dart';
import 'package:forme_app/core/widgets/flutter_toast.dart';
import 'package:forme_app/features/trainee_features/profile/data/models/Complete_profile_data.dart';
import 'package:forme_app/features/trainee_features/profile/data/repos/complete_profile_repo.dart';

import '../../../../../core/errors/failures.dart';

class CompleteProfileRepoImpl implements CompleteProfileRepo {
  const CompleteProfileRepoImpl();
  @override
  Either<Failure, String> handleCompleteProfile(
      {required CompleteProfileData data}) {
    try {
      String name = data.name;
      //String? photo = data.photo;
      //String phone = data.phone;
      String gender = data.gender;
      String country = data.country;
      if (name.isEmpty) {
        toastInfo(msg: data.name);
        return left(ServerFailure(data.name));
      }
      if (gender.isEmpty) {
        toastInfo(msg: data.gender);
        return left(ServerFailure(data.name));
      }
      if (country.isEmpty) {
        toastInfo(msg: data.country);
        return left(ServerFailure(data.name));
      }
      return right('success');
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
