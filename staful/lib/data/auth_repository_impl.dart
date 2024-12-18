import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthInterface>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

abstract class AuthInterface {
  Future<UserCredential> signUp({
    required String userId,
    required String password,
  });
  Future<UserCredential> logIn({
    required String userId,
    required String password,
  });
  Future<User?> checkUser();
  Future<void> logOut();
}

class AuthRepository implements AuthInterface {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  // 회원가입
  @override
  Future<UserCredential> signUp({
    required String userId,
    required String password,
  }) async {
    try {
      final email = '$userId@staful.com'; // userId를 이메일처럼 처리
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User registered: ${userCredential.user?.uid}');
      return userCredential;
    } catch (e) {
      throw Exception(e);
    }
  }

  // 로그인
  @override
  Future<UserCredential> logIn({
    required String userId,
    required String password,
  }) async {
    try {
      final email = '$userId@staful.com';
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in: ${userCredential.user?.uid}');
      return userCredential;
    } catch (e) {
      throw Exception('로그인 실패: $e');
    }
  }

  // 로그인된 유저 체크
  @override
  Future<User?> checkUser() async {
    User? user = _firebaseAuth.currentUser;
    if (user == null) throw Exception('User not found');
    return user;
  }

  // 로그아웃
  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
