import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staful/domain/models/user_model.dart';

abstract class UserInterface {
  Future<void> saveUserToFirestore(User user);
  Future<User?> fetchUserFromFirestore(String uid);
  Future<void> saveUserToPreferences(String uid, String userId, String name);
  Future<Map<String, String?>> loadUserFromPreferences();
}

class UserRepository implements UserInterface {
  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

  // Firestore에 유저 데이터 저장
  @override
  Future<void> saveUserToFirestore(User user) async {
    final userDoc = _firestore.collection('users').doc(user.uid);

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
  Future<void> saveUserToPreferences(
      String uid, String userId, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
    await prefs.setString('userId', userId);
    await prefs.setString('name', name);
    print("User data saved to SharedPreferences");
  }

  // SharedPreferences에서 유저 정보 불러오기
  @override
  Future<Map<String, String?>> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final userId = prefs.getString('userId');
    final name = prefs.getString('name');

    if (uid == null) {
      print("No user data found in SharedPreferences");
      return {};
    }

    return {'uid': uid, 'userId': userId, 'name': name};
  }
}
