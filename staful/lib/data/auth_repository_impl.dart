import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<String> registerUser(String userId, String password);
  Future<String> loginUser(String userId, String password);
}

class AuthRepository implements AuthInterface {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  // 회원가입
  @override
  Future<String> registerUser(String userId, String password) async {
    try {
      final email = '$userId@staful.com'; // userId를 이메일처럼 처리
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User registered: ${userCredential.user?.uid}');
      return userCredential.user!.uid;
    } catch (e) {
      throw Exception('회원가입 실패: $e');
    }
  }

  // 로그인
  @override
  Future<String> loginUser(String userId, String password) async {
    try {
      final email = '$userId@staful.com';
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in: ${userCredential.user?.uid}');
      return userCredential.user!.uid;
    } catch (e) {
      throw Exception('로그인 실패: $e');
    }
  }
}
