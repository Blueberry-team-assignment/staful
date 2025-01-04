import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_detail_model.freezed.dart';
part 'pay_detail_model.g.dart';

@JsonEnum(alwaysCreate: true) // Enum을 JSON으로 처리
enum PayType {
  @JsonValue('hourly') // JSON에서 'hourly'로 직렬화
  hourly,
  @JsonValue('fixed') // JSON에서 'fixed'로 직렬화
  fixed,
}

@freezed
class PayDetailModel with _$PayDetailModel {
  const factory PayDetailModel({
    String? id,
    required PayType payType,
    required String desc,
    required int amount,
    String? templateId,
    @Default(false) bool isSelected,
    @Default(true) bool isVisible,
    @Default(false) bool isDeleted,
  }) =  _PayDetailModel;

   factory PayDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PayDetailModelFromJson(json);
}
