import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_management_app/domain/repositories/auth_firebase_repository.dart';

class AuthService extends AuthRepository {
  AuthService(this._firebaseAuth, this._firestore);
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<bool> login({String? email, String? password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email!, password: password!);
      final user = userCredential.user!;
      await updateUserData(user);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> signup({String? email, String? password, String? name, String? lastname1, String? lastname2}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!);
      final user = userCredential.user!;
      await updateUserData(user);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool?> signInWithGoogle() async {
    // Trigger the authentication flow

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // cancelled login
        print('Google Signin ERROR! googleUser: null!');
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;

      // Once signed in, return the UserCredential
      final authResult = await _firebaseAuth.signInWithCredential(credential);
      final user = authResult.user!;

      await updateUserData(user);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<DocumentSnapshot> updateUserData(User user) async {
    final userRef = _firestore.collection('users').doc(user.uid);

    userRef.set({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoURL,
      'lastSignIn': DateTime.now(),
      'displayName': user.displayName,
    });

    return await userRef.get();
  }
}
