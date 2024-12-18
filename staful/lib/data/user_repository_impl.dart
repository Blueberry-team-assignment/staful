import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staful/domain/models/user_model.dart';
import 'package:staful/dto/sign_up_dto.dart';

final userRepositoryProvider = Provider<UserInterface>((ref) {
  return UserRepository(FirebaseFirestore.instance);
});

abstract class UserInterface {
  Future<void> saveUserToFirestore({
    required String uid,
    required SignUpDto signUpDto,
  });
  Future<User?> fetchUserFromFirestore(String uid);
  Future<void> saveUserToPreferences(String uid, SignUpDto signUpDto);
  Future<Map<String, String?>> loadUserFromPreferences();
}

class UserRepository implements UserInterface {
  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

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
  Future<User?> fetchUserFromFirestore(String uid) async {
    final userDoc = _firestore.collection('users').doc(uid);

    final snapshot = await userDoc.get();
    if (!snapshot.exists) {
      print('User document not found');
      return null;
    }
    return User.fromFirestore(uid, snapshot.data()!);
  }

  // SharedPreferences에 유저 정보 저장
  @override
  Future<void> saveUserToPreferences(String uid, SignUpDto signUpDto) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
    await prefs.setString('userId', signUpDto.id);
    await prefs.setString('name', signUpDto.name);
    await prefs.setString('businessName', signUpDto.businessName);
    await prefs.setString(
        'openingDate', signUpDto.openingDate.toIso8601String());
    print("User data saved to SharedPreferences");
  }

  // SharedPreferences에서 유저 정보 불러오기
  @override
  Future<Map<String, String?>> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final userId = prefs.getString('userId');
    final name = prefs.getString('name');
    final businessName = prefs.getString('businessName');
    final openingDate = prefs.getString('openingDate');

    if (uid == null) {
      print("No user data found in SharedPreferences");
      return {};
    }

    return {
      'uid': uid,
      'userId': userId,
      'name': name,
      'businessName': businessName,
      'openingDate': openingDate,
    };
  }
}
