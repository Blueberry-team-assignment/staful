import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';

part 'pay_detail_dto.freezed.dart';
part 'pay_detail_dto.g.dart';

@JsonEnum(alwaysCreate: true) // Enum을 JSON으로 처리
enum PayTypeDto {
  @JsonValue('hourly') // JSON에서 'hourly'로 직렬화
  hourly,
  @JsonValue('fixed') // JSON에서 'fixed'로 직렬화
  fixed,
}

@freezed
class PayDetailDto with _$PayDetailDto {
  const factory PayDetailDto({
    String? id,
    required PayTypeDto payType,
    required String desc,
    required int amount,
  }) = _PayDetailDto;

  factory PayDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PayDetailDtoFromJson(json);
}

extension PayDetailDtoMapper on PayDetailDto {
  // DTO -> 도메인 모델 변환
  PayDetailModel toDomain() {
    return PayDetailModel(
      id: id,
      payType: PayType.values[payType.index], // Enum 변환
      desc: desc,
      amount: amount,
    );
  }
}

extension PayDetailModelMapper on PayDetailModel {
  // 도메인 모델 -> DTO 변환
  PayDetailDto toDto() {
    return PayDetailDto(
      id: id,
      payType: PayTypeDto.values[payType.index], // Enum 변환
      desc: desc,
      amount: amount,
    );
  }
}
