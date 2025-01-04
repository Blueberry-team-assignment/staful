import 'package:freezed_annotation/freezed_annotation.dart';

part 'payroll_model.freezed.dart';

@freezed
class PayrollModel with _$PayrollModel {
  const factory PayrollModel({
    String? id,
    required DateTime date, // y,m
    required String staffId,
    required String templateId,
    @Default(false) bool isSelected,
    @Default(true) bool isVisible,
    @Default(false) bool isDeleted,
  }) =  _PayrollModel;
}
