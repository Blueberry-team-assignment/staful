import 'package:firebase_auth/firebase_auth.dart';
import 'package:staful/feature/auth/domain/model/user_model.dart';

abstract class AuthInterface {
  Future<UserCredential> signUp({
    required String userId,
    required String password,
  });
  Future<UserModel> logIn({
    required String userId,
    required String password,
  });
  Future<UserModel> checkUser();
  Future<void> logOut();
}