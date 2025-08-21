
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/features/auth/phone_login/data/models/login_request_body.dart';
import 'package:mybenhariders/features/auth/phone_login/data/repo/login_repo.dart';
import 'package:mybenhariders/features/auth/phone_login/data/repo/success_login_result.dart';
import 'package:mybenhariders/features/auth/phone_login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    ApiResult<SuccessLoginResult> response = await _loginRepo.loginWithPhone(
      loginRequestBody,
    );
    response.when(
      success: (data) {
        data.when(
          onboarded: (onboarded) {
            print('Onboarded login successful');
          },
          onboarding: (result) {},
        );
        emit(LoginState.success(data));
      },
      error: (message) {
        emit(LoginState.error(response: message));
      },
    );

    emit(LoginState.success('Login successful'));
  }
}
