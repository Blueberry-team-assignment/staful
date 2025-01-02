import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staful/data/models/user_model.dart';
import 'package:staful/data/dto/auth/sign_up_dto.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(FirebaseFirestore.instance);
});

abstract class UserRepository {
  Future<void> saveUserToFirestore({
    required String uid,
    required SignUpDto signUpDto,
  });
  Future<User> fetchUserFromFirestore({
    required String uid,
  });
  Future<void> saveUserToPreferences({
    required User user,
  });
  Future<User> loadUserFromPreferences();
}

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _firestore;

  UserRepositoryImpl(this._firestore);

  // Firestore에 유저 데이터 저장
  @override
  Future<void> saveUserToFirestore({
    required String uid,
    required SignUpDto signUpDto,
  }) async {
    final userDoc = _firestore.collection('users').doc(uid);

    final User user = User(
        businessName: signUpDto.businessName,
        userId: signUpDto.id,
        name: signUpDto.name,
        openingDate: signUpDto.openingDate,
        uid: uid,
        createdAt: DateTime.now());

    await userDoc.set(user.toFirestore()); // User 객체를 Map으로 변환 후 저장
    print('User data saved to Firestore with business info');
  }

  // Firestore에서 유저 데이터 가져오기
  @override
  Future<User> fetchUserFromFirestore({
    required String uid,
  }) async {
    final userDoc = _firestore.collection('users').doc(uid);

    final snapshot = await userDoc.get();
    if (!snapshot.exists) {
      throw Exception('User data not found');
    }
    return User.fromFirestore(uid, snapshot.data()!);
  }

  // SharedPreferences에 유저 정보 저장
  @override
  Future<void> saveUserToPreferences({required User user}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', user.uid);
    await prefs.setString('userId', user.userId);
    await prefs.setString('name', user.name);
    await prefs.setString('businessName', user.businessName);
    await prefs.setString(
      'openingDate',
      user.openingDate.toIso8601String(),
    );
    await prefs.setString('createdAt', user.createdAt.toIso8601String());
    print("User data saved to SharedPreferences");
  }

  // SharedPreferences에서 유저 정보 불러오기
  @override
  Future<User> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final userId = prefs.getString('userId');
    final name = prefs.getString('name');
    final businessName = prefs.getString('businessName');
    final openingDate = prefs.getString('openingDate');
    final createdAt = prefs.getString('createdAt');

    if (uid == null || userId == null) {
      throw Exception("No user data found in SharedPreferences");
    }

    return User(
        uid: uid,
        userId: userId,
        name: name!,
        businessName: businessName!,
        openingDate: DateTime.parse(openingDate!),
        createdAt: DateTime.parse(createdAt!));
  }
}
