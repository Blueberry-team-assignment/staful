// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:staful/feature/staff/data/dto/staff_dto.dart';
// import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
// import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
// import 'package:staful/feature/staff/domain/model/staff_model.dart';

// final staffNotifierProvider =
//     StateNotifierProvider.autoDispose<StaffNotifier, StaffState>((ref) {
//   final staffInterface = ref.read(staffRepositoryProvider);
//   return StaffNotifier(staffInterface);
// });

// class StaffNotifier extends StateNotifier<StaffState> {
//   final StaffInterface _staffInterface;

//   StaffNotifier(this._staffInterface) : super(StaffState());

//   Future<void> fetchStaffList(String uid) async {
//     try {
//       state = state.copyWith(isLoading: true);
//       final staffList = await _staffInterface.fetchAllStaffs(uid: );
//       state = state.copyWith(staffList: staffList, isLoading: false);
//     } catch (e) {
//       state = state.copyWith(isLoading: false);
//       throw Exception('Failed to fetch staff list: $e');
//     }
//   }

//   Future<void> createStaff(String uid, StaffDto createStaffDto) async {
//     try {
//       state = state.copyWith(isLoading: true);
//       final newStaff = await _staffInterface.createStaff(
//         uid: uid,
//         dto: createStaffDto,
//       );
//       state = state.copyWith(
//         staffList: [...state.staffList!, newStaff],
//         isLoading: false,
//       );
//     } catch (e) {
//       state = state.copyWith(isLoading: false);
//       throw Exception('Failed to create staff: $e');
//     }
//   }

//   Future<void> updateStaff(String uid, StaffDto updateStaffDto) async {
//     try {
//       state = state.copyWith(isLoading: true);
//       final updatedStaff = await _staffInterface.updateStaff(
//         uid: uid,
//         dto: updateStaffDto,
//       );
//       state = state.copyWith(
//         staffList: state.staffList?.map((staff) {
//           return staff.staffId == updatedStaff.staffId ? updatedStaff : staff;
//         }).toList(),
//         isLoading: false,
//       );
//     } catch (e) {
//       state = state.copyWith(isLoading: false);
//       throw Exception('Failed to update staff: $e');
//     }
//   }
// }

// class StaffState {
//   final List<StaffModel>? staffList;
//   final bool isLoading;

//   StaffState({
//     this.isLoading = false,
//     this.staffList,
//   });

//   StaffState copyWith({
//     List<StaffModel>? staffList,
//     bool? isLoading,
//   }) {
//     return StaffState(
//       staffList: staffList ?? this.staffList,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }
