import 'package:get_it/get_it.dart';
import 'package:mybenhariders/features/auth/google_signin/cubit/google_signin_cubit.dart';
import 'package:mybenhariders/features/auth/google_signin/data/repo/google_signin_repo.dart';
import 'package:mybenhariders/features/auth/google_signin/data/repo/login_with_google_repo.dart';
import 'package:mybenhariders/features/auth/phone_login/data/repo/login_repo.dart';
import 'package:mybenhariders/features/auth/phone_login/logic/cubit/login_cubit.dart';
import 'package:mybenhariders/core/networking/api_service.dart';
import 'package:mybenhariders/core/networking/google_signin_service.dart';

/// DI module for authentication-related dependencies
class AuthModule {
  static void register(GetIt getIt) {
    // Repositories
    getIt.registerLazySingleton<LoginWithPhoneRepo>(
      () => LoginWithPhoneRepo(getIt<ApiService>()),
    );

    getIt.registerLazySingleton<GoogleSignInRepo>(
      () => GoogleSignInRepo(getIt<GoogleSignInService>()),
    );

    // Cubits/Controllers (Factory - new instance each time)
    getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt<LoginWithPhoneRepo>()),
    );
    getIt.registerLazySingleton<LoginWithGoogleRepo>(
      () => LoginWithGoogleRepo(getIt<ApiService>()),
    );
    getIt.registerFactory<GoogleSignInCubit>(
      () => GoogleSignInCubit(
        getIt<GoogleSignInRepo>(),
        getIt<LoginWithGoogleRepo>(),
      ),
    );
  }
}
