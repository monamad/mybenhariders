import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn;

  GoogleSignInService(GoogleSignIn googleSignIn) : _googleSignIn = googleSignIn;

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    return await _googleSignIn.signIn();
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
