import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/update_staff_dto.freezed.dart';
part 'generated/update_staff_dto.g.dart';

@freezed
class UpdateStaffDto with _$UpdateStaffDto {
  const factory UpdateStaffDto({
    String? name,
    String? image,
    List<String>? workDays,
    Map<String, Map<String, int>>? workHours,
    List<String>? workDate,
    int? templateId,
    String? desc,
    required String staffId,
  }) = _UpdateStaffDto;

  factory UpdateStaffDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateStaffDtoFromJson(json);
}
