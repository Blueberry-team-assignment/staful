import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/create_staff_dto.freezed.dart';
part 'generated/create_staff_dto.g.dart';

@freezed
class CreateStaffDto with _$CreateStaffDto {
  const factory CreateStaffDto({
    required String name,
    String? image,
    List<String>? workDays,
    Map<String, Map<String, int>>? workHours,
    List<String>? workDate,
    int? templateId,
    String? desc,
  }) = _CreateStaffDto;

  factory CreateStaffDto.fromJson(Map<String, dynamic> json) =>
      _$CreateStaffDtoFromJson(json);
}
