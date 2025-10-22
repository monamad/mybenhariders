import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import '../cubit/google_signin_cubit.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          success: (idToken) {
            Navigator.pushNamed(context, Routes.userMainLayout);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم تسجيل الدخول بنجاح!')),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('خطأ: $message')));
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(orElse: () => false);

        return ElevatedButton.icon(
          onPressed: isLoading
              ? null
              : () => context.read<GoogleSignInCubit>().signInWithGoogle(),
          icon: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.login),
          label: Text(
            isLoading ? 'جاري تسجيل الدخول...' : 'تسجيل الدخول بـ Google',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
