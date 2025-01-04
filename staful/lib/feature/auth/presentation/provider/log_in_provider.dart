import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/data/repositories/auth_repository.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/models/user_model.dart';
import 'package:staful/feature/auth/domain/interfaces/auth_interface.dart';
import 'package:staful/feature/auth/domain/interfaces/user_interface.dart';
import 'package:staful/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:staful/feature/auth/presentation/provider/state/log_in_state.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/auth/data/repositories/user_repository.dart';
import 'package:staful/feature/auth/data/dto/log_in_dto.dart';
import 'package:staful/feature/staff/provider/staff_provider.dart';

final logInProvider =
    StateNotifierProvider.autoDispose<LogInNotifier, LogInState>((ref) {
  final logInUsecase = ref.watch(loginUsecaseProvider);
  return LogInNotifier(logInUsecase);
});

class LogInNotifier extends StateNotifier<LogInState> {
  final LogInUsecase _logInUsecase;

  LogInNotifier(
    this._logInUsecase,
  ) : super(LogInState());

  Future<void> logIn({
    required String id,
    required String password,
  }) async {
    try {
      setLoading(true);

      final authUser =
          await _logInUsecase.execute(userId: id, password: password);

      state = state.copyWith(
        authUser: authUser,
      );

      // 스태프, 템플릿 데이터 fetch
      // await _ref.watch(staffNotifierProvider.notifier).fetchStaffList(uid);

      // _ref.read(templateNotifierProvider.notifier).fetch
      setLoading(false);
    } catch (e) {
      setLoading(false);
      rethrow;
    }
  }

  // Future<void> checkAutoLogin() async {
  //   final user = _authInterface.checkUser();
  //   final savedUser = await _userInterface.loadUserFromPreferences();

  //   if (user.uid == savedUser.uid) {
  //     state = state.copyWith(
  //         user: await _userInterface.fetchUserFromFirestore(uid: user.uid),
  //         isLoggedIn: true);
  //     await _ref.watch(staffNotifierProvider.notifier).fetchStaffList(user.uid);
  //   } else {
  //     _authInterface.logOut();
  //     state = state.copyWith(isLoggedIn: false);
  //   }
  // }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
