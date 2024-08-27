import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../domain/models/user.dart';

abstract class BaseAuthRepository {
//get user
  Stream<auth.User?> get user;

//sign up
  Future<auth.User?> signUp({required User user, required String password});

//login with email and password
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password});

//signout
  Future<void> signOut();
}
