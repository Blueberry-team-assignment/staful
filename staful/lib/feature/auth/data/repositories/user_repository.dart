import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staful/data/models/user_model.dart';
import 'package:staful/feature/auth/data/dto/sign_up_dto.dart';
import 'package:staful/feature/auth/domain/interfaces/user_interface.dart';
import 'package:staful/feature/auth/domain/model/user_model.dart';

final userRepositoryProvider = Provider<UserInterface>((ref) {
  return UserRepository(FirebaseFirestore.instance);
});

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
  Future<UserModel> fetchUserFromFirestore({
    required String uid,
  }) async {
    final userDoc = _firestore.collection('users').doc(uid);

    final snapshot = await userDoc.get();
    if (!snapshot.exists) {
      throw Exception('User data not found');
    }

    final data = snapshot.data()!;
    data['uid'] = uid;
    return UserModel.fromJson(data);
  }

  // SharedPreferences에 유저 정보 저장
  @override
  Future<void> saveUserToPreferences({required UserModel user}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', user.uid);
    await prefs.setString('userId', user.userId);
    await prefs.setString('name', user.name);
    await prefs.setString('businessName', user.businessName);
    await prefs.setString(
      'openingDate',
      user.openingDate.toIso8601String(),
    );
    
    print("User data saved to SharedPreferences");
  }

  // SharedPreferences에서 유저 정보 불러오기
  @override
  Future<UserModel> loadUserFromPreferences() async {
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

    return UserModel(
      uid: uid,
      userId: userId,
      name: name!,
      businessName: businessName!,
      openingDate: DateTime.parse(openingDate!),
    );
  }
}
