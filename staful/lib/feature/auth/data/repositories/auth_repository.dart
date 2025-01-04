import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/data/repositories/user_repository.dart';
import 'package:staful/feature/auth/domain/interfaces/auth_interface.dart';
import 'package:staful/feature/auth/domain/interfaces/user_interface.dart';
import 'package:staful/feature/auth/domain/model/user_model.dart';

final authRepositoryProvider = Provider<AuthInterface>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return AuthRepository(FirebaseAuth.instance, userRepository);
});

class AuthRepository implements AuthInterface {
  final FirebaseAuth _firebaseAuth;
  final UserInterface _userRepository;

  AuthRepository(this._firebaseAuth, this._userRepository);

  // 회원가입
  @override
  Future<UserCredential> signUp({
    required String userId,
    required String password,
  }) async {
    try {
      final email = '$userId@stafful.com'; // userId를 이메일처럼 처리
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
  Future<UserModel> logIn({
    required String userId,
    required String password,
  }) async {
    try {
      final email = '$userId@stafful.com';
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in: ${userCredential.user!.uid}');

      final authUser = await _userRepository.fetchUserFromFirestore(
          uid: userCredential.user!.uid);

      return authUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  // 로그인된 유저 체크
  @override
  Future<UserModel> checkUser() async {
    User? user = _firebaseAuth.currentUser;

    if (user == null) throw Exception('User not found');

    final authUser = await _userRepository.fetchUserFromFirestore(uid: user.uid);
    return authUser;
  }

  // 로그아웃
  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
