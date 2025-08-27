import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mybenhariders/core/networking/api_result.dart';
import 'package:mybenhariders/core/networking/google_signin_service.dart';

class GoogleSignInRepo {
  final GoogleSignInService _googleSignIn;

  GoogleSignInRepo(GoogleSignInService googleSignIn)
    : _googleSignIn = googleSignIn;

  Future<ApiResult<String?>> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn
          .signInWithGoogle();
      if (googleAccount == null) {
        return ApiResult.error('Google Sign-In cancelled by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;

      final String? idToken = googleAuth.idToken;

      //await debuging(idToken);

      return idToken != null
          ? ApiResult.success(idToken)
          : ApiResult.error('Failed to retrieve ID token');
    } catch (error) {
      return ApiResult.error('Google Sign-In failed: $error');
    }
  }

  Future<void> debuging(String? idToken) async {
    if (idToken != null) {
      const serverUrl = 'http://192.168.1.8:3000/store-token';

      try {
        await http.post(
          Uri.parse(serverUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'token': idToken}),
        );
      } catch (e) {
        print('\x1B[31m❌ Failed to send token to server: $e\x1B[0m');
      }
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
