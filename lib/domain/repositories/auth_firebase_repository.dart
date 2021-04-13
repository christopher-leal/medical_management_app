import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<bool> login({String email, String password});
  Future<void> logout();
  Future<bool> signup({String email, String password});
  Future<bool> signInWithGoogle();
  Future<DocumentSnapshot> updateUserData(User user);
}
