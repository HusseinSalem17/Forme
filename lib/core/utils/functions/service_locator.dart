import 'package:forme_app/features/user_features/profile/data/repos/complete_profile_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  getIt.registerSingleton<CompleteProfileRepoImpl>(
    const CompleteProfileRepoImpl(
        //get() => return the singelton that i made
        ),
  );
}
