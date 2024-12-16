class User {
  final String id; // Firebase Authentication uid 또는 Firestore userId
  final String name;
  final String businessName;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.businessName,
    required this.createdAt,
  });

  // Firestore에서 데이터를 불러올 때 사용하는 팩토리 메서드
  factory User.fromFirestore(String id, Map<String, dynamic> data) {
    return User(
      id: id,
      name: data['name'] ?? '',
      businessName: data['businessName'] ?? '',
      createdAt: DateTime.parse(data['createdAt']),
    );
  }

  // Firestore에 데이터를 저장할 때 사용하는 메서드
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'businessName': businessName,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
