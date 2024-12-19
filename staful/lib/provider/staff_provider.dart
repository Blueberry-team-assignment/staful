import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/domain/models/staff_model.dart';
import 'package:staful/domain/staff_repository.dart';

final staffRepositoryProvider = Provider<StaffRepository>((ref) => StaffRepositoryImpl());

// 스태프 상태 관리
final staffProvider = StateNotifierProvider<StaffNotifier, List<SelectableStaff>>((ref) {
  final repository = ref.read(staffRepositoryProvider);
  return StaffNotifier(repository);
});

class StaffNotifier extends StateNotifier<List<SelectableStaff>> {
  final StaffRepository _repository;

  StaffNotifier(this._repository) : super([]);

  Future<void> loadStaff() async {
    final staff = await _repository.fetchStaff();
    state = staff;
  }
}
