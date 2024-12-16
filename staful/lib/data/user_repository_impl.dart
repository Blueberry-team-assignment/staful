import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

// 유저데이터 DB에 저장
Future<void> saveUserToFirestore(String userId, String name) async {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  if (uid == null) {
    print('No user is logged in');
    return;
  }

  final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

  await userDoc.set({
    'userId': userId,
    'name': name,
    'createdAt': DateTime.now().toIso8601String(),
  });
  print('User saved to Firestore');
}

// 유저 데이터 조회
Future<Map<String, dynamic>?> fetchUserFromFirestore() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  if (uid == null) {
    print('No user is logged in');
    return null;
  }

  final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

  final snapshot = await userDoc.get();
  if (!snapshot.exists) {
    print('User document not found');
    return null;
  }

  return snapshot.data();
  // return User.fromFirestore(snapshot.id, snapshot.data()!);
}

Future<void> registerAndSaveUser(
    String userId, String password, String name) async {
  await registerUser(userId, password); // Firebase Authentication 회원가입
  await saveUserToFirestore(userId, name); // Firestore에 추가 정보 저장
}

Future<void> loginAndFetchUser(String userId, String password) async {
  await loginUser(userId, password); // Firebase Authentication 로그인
  final userData = await fetchUserFromFirestore(); // Firestore에서 유저 데이터 가져오기
  print('User Data: $userData');
}

// SharedPreferences에 유저정보 저장(회원가입 성공 시, 로그인 시)
Future<void> saveUserToPreferences(
    String uid, String userId, String name) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('uid', uid);
  await prefs.setString('userId', userId);
  await prefs.setString('name', name);
  // 가게이름... 등
  print("User data saved to SharedPreferences");
}

// SharedPreferences에서 유저 정보 가져오기(앱 재시작 시 등등)
Future<Map<String, String?>> loadUserFromPreferences() async {
  final prefs = await SharedPreferences.getInstance();

  final userId = prefs.getString('userId');
  final name = prefs.getString('name');

  if (userId == null) {
    print("No user data found in SharedPreferences");
    return {};
  }

  return {
    'userId': userId,
    'name': name,
  };
}

// 회원가입
Future<void> registerUser(String userId, String password) async {
  try {
    // userId를 이메일처럼 처리 (예: "userId@custom.com")
    final email = '$userId@staful.com';

    // Firebase Authentication에 회원가입
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('User registered successfully!');
  } catch (e) {
    print('Error during registration: $e');
  }
}

// 로그인
Future<void> loginUser(String userId, String password) async {
  try {
    // userId를 이메일처럼 처리 (예: "userId@custom.com")
    final email = '$userId@custom.com';

    // Firebase Authentication 로그인
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print('User logged in: ${userCredential.user?.uid}');
  } catch (e) {
    print('Error during login: $e');
  }
}
