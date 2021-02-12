import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseInterface {
  Future<bool> login({String email, String password});
  Future<bool> logout();
  Future<bool> signup({String email, String password});
  Future<UserCredential> signInWithGoogle();
}
