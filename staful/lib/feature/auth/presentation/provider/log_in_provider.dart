import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/domain/usecases/check_user_usecase.dart';
import 'package:staful/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:staful/feature/auth/presentation/provider/state/log_in_state.dart';

final logInProvider =
    StateNotifierProvider.autoDispose<LogInNotifier, LogInState>((ref) {
  final logInUsecase = ref.watch(loginUsecaseProvider);
  final checkUserUsecase = ref.watch(checkUserUsecaseProvider);

  return LogInNotifier(
    logInUsecase,
    checkUserUsecase,
  );
});

class LogInNotifier extends StateNotifier<LogInState> {
  final LogInUsecase _logInUsecase;
  final CheckUserUsecase _checkUserUsecase;

  LogInNotifier(
    this._logInUsecase,
    this._checkUserUsecase,
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
        isLoggedIn: true,
      );

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

    state = state.copyWith(
      authUser: authUser,
      isLoggedIn: true,
    );
    setLoading(false);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
