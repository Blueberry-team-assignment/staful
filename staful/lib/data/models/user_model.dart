class User {
  final String uid; // Firebase Authentication에서 생성된 uid
  final String userId; // 사용자 ID
  final String name; // 사용자 이름
  final String businessName; // 매장명
  final DateTime openingDate; // 개업일
  final DateTime createdAt; // 계정 생성일

  User({
    required this.uid,
    required this.userId,
    required this.name,
    required this.businessName,
    required this.openingDate,
    required this.createdAt,
  });

  // Firestore에서 데이터를 불러올 때 사용하는 팩토리 메서드
  factory User.fromFirestore(String uid, Map<String, dynamic> data) {
    return User(
      uid: uid,
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      businessName: data['businessName'] ?? '',
      openingDate: DateTime.parse(data['openingDate'] ?? ''),
      createdAt: DateTime.parse(data['createdAt'] ?? ''),
    );
  }

  // Firestore에 저장할 때 사용
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'userId': userId,
      'name': name,
      'businessName': businessName,
      'openingDate': openingDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
