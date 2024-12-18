import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/log_in_dto.freezed.dart';
part 'generated/log_in_dto.g.dart';

@freezed
class LogInDto with _$LogInDto {
  const factory LogInDto({
    required String id,
    required String password,
  }) = _LogInDto;

  factory LogInDto.fromJson(Map<String, dynamic> json) =>
      _$LogInDtoFromJson(json);
}

// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs
