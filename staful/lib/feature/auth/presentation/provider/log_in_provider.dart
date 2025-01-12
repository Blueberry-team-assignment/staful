import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/data/repositories/auth_repository.dart';
import 'package:staful/feature/auth/domain/interfaces/auth_interface.dart';
import 'package:staful/feature/auth/domain/usecases/check_user_usecase.dart';
import 'package:staful/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:staful/feature/auth/presentation/provider/state/log_in_state.dart';
import 'package:staful/provider/uid_provider.dart';

final logInProvider = StateNotifierProvider<LogInNotifier, LogInState>((ref) {
  final logInUsecase = ref.watch(loginUsecaseProvider);
  final checkUserUsecase = ref.watch(checkUserUsecaseProvider);
  final authInterface = ref.watch(authRepositoryProvider);
  final uidNotifier = ref.watch(uidProvider.notifier);
  return LogInNotifier(
    logInUsecase,
    checkUserUsecase,
    authInterface,
    uidNotifier,
  );
});

class LogInNotifier extends StateNotifier<LogInState> {
  final LogInUsecase _logInUsecase;
  final CheckUserUsecase _checkUserUsecase;
  final AuthInterface _authInterface;
  final UidNotifier _uidNotifier;

  LogInNotifier(
    this._logInUsecase,
    this._checkUserUsecase,
    this._authInterface,
    this._uidNotifier,
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

  Future<void> logout() async {
    setLoading(true);
    await _authInterface.logOut();
    state = state.copyWith(isLoggedIn: false, authUser: null);
    _uidNotifier.resetUid();
    setLoading(false);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
