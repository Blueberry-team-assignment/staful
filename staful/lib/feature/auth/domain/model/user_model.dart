import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({ 
  required String uid, // Firebase Authentication에서 생성된 uid
  required String userId, // 사용자가 회원가입 시 입력한 ID
  required String name, // 사용자 이름
  required String businessName, // 매장명
  required DateTime openingDate, // 개업일
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
