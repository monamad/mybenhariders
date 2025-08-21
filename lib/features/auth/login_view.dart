import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/core/di/dependancy_injection.dart';
import 'package:mybenhariders/features/auth/google_signin/cubit/google_signin_cubit.dart';
import 'package:mybenhariders/features/auth/google_signin/view/google_sign_in_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GoogleSignInCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign-In'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthenticationStatus(),
              SizedBox(height: 30),
              GoogleSignInButton(),
              SizedBox(height: 20),
              GoogleSignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
