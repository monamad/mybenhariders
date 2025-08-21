import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybenhariders/core/routes/routes.dart';
import '../cubit/google_signin_cubit.dart';

// Example usage in a widget
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
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
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return ElevatedButton.icon(
          onPressed: isLoading
              ? null
              : () {
                  context.read<GoogleSignInCubit>().signInWithGoogle();
                },
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        );
      },
    );
  }
}

class GoogleSignOutButton extends StatelessWidget {
  const GoogleSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleSignInCubit, GoogleSignInState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
                  context.read<GoogleSignInCubit>().signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم تسجيل الخروج')),
                  );
                },
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('تسجيل الخروج'),
        );
      },
    );
  }
}

class AuthenticationStatus extends StatelessWidget {
  const AuthenticationStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleSignInCubit, GoogleSignInState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            children: [
              Icon(
                state.when(
                  initial: () => Icons.person_outline,
                  loading: () => Icons.hourglass_empty,
                  success: (_) => Icons.check_circle,
                  error: (_) => Icons.error_outline,
                ),
                size: 48,
                color: state.when(
                  initial: () => Colors.grey,
                  loading: () => Colors.orange,
                  success: (_) => Colors.green,
                  error: (_) => Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.when(
                  initial: () => 'غير مسجل الدخول',
                  loading: () => 'جاري المعالجة...',
                  success: (_) => 'تم تسجيل الدخول بنجاح',
                  error: (message) => 'فشل تسجيل الدخول',
                ),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: state.when(
                    initial: () => Colors.grey[600],
                    loading: () => Colors.orange[700],
                    success: (_) => Colors.green[700],
                    error: (_) => Colors.red[700],
                  ),
                ),
              ),
              if (state is Error)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    state.when(
                      initial: () => '',
                      loading: () => '',
                      success: (_) => '',
                      error: (message) => message,
                    ),
                    style: TextStyle(fontSize: 12, color: Colors.red[600]),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Google Sign-In Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthenticationStatus(),
              const SizedBox(height: 30),
              const GoogleSignInButton(),
              const SizedBox(height: 20),
              const GoogleSignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
