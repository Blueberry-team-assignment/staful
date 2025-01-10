import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/domain/usecases/check_user_usecase.dart';
import 'package:staful/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:staful/feature/auth/presentation/provider/state/log_in_state.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';

final logInProvider =
    StateNotifierProvider.autoDispose<LogInNotifier, LogInState>((ref) {
  final logInUsecase = ref.watch(loginUsecaseProvider);
  final checkUserUsecase = ref.watch(checkUserUsecaseProvider);
  final staffInterface = ref.watch(staffRepositoryProvider);

  return LogInNotifier(logInUsecase, checkUserUsecase, staffInterface);
});

class LogInNotifier extends StateNotifier<LogInState> {
  final LogInUsecase _logInUsecase;
  final CheckUserUsecase _checkUserUsecase;
  final StaffInterface _staffInterface;

  LogInNotifier(
    this._logInUsecase,
    this._checkUserUsecase,
    this._staffInterface,
  ) : super(LogInState());

  Future<void> logIn({
    required String id,
    required String password,
  }) async {
    try {
      setLoading(true);

      final authUser =
          await _logInUsecase.execute(userId: id, password: password);

      final staffList = await _staffInterface.fetchAllStaffs(uid: authUser.uid);

      state = state.copyWith(
        staffList: staffList,
        authUser: authUser,
        isLoggedIn: true,
      );

      // if (!mounted) return;
      // _templateNotifier.setList(loginResult.templateList);
      // _staffNotifier.setList(loginResult.staffList);
      // if (!mounted) return;

      setLoading(false);
    } catch (e) {
      setLoading(false);
      print(e);
      throw Exception(e);
    }
  }

  Future<void> checkUser() async {
    setLoading(true);

    final authUser = await _checkUserUsecase.execute();
    // final initializedData = await _logInUsecase.initialize(authUser.uid);
    // if (!mounted) return;
    // _templateNotifier.setList(initializedData.templateList);
    // _staffNotifier.setList(initializedData.staffList);
    // if (!mounted) return;

    final staffList = await _staffInterface.fetchAllStaffs(uid: authUser.uid);

    state = state.copyWith(
      staffList: staffList,
      authUser: authUser,
      isLoggedIn: true,
    );
    setLoading(false);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
