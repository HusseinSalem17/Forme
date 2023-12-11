import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/failures.dart';

import '../models/Complete_profile_data.dart';

abstract class CompleteProfileRepo {
  Either<Failure, String> handleCompleteProfile({
    required CompleteProfileData data,
  });
}
