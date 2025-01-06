import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/domain/usecases/check_user_usecase.dart';
import 'package:staful/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:staful/feature/auth/presentation/provider/state/log_in_state.dart';
import 'package:staful/feature/staff/presentation/provider/staff_provider.dart';
import 'package:staful/feature/template/domain/usecases/templates_crud_usecase.dart';
import 'package:staful/feature/template/presentation/provider/template_provider.dart';

final logInProvider =
    StateNotifierProvider.autoDispose<LogInNotifier, LogInState>((ref) {
  final logInUsecase = ref.watch(loginUsecaseProvider);
  final checkUserUsecase = ref.watch(checkUserUsecaseProvider);
  final templateCrudUsecase = ref.watch(templateCrudUsecaseProvider);
  final templateNotifier = ref.watch(templateNotifierProvider.notifier);
  final staffNotifier = ref.watch(staffNotifierProvider.notifier);
  return LogInNotifier(logInUsecase, checkUserUsecase, templateCrudUsecase,
      templateNotifier, staffNotifier);
});

class LogInNotifier extends StateNotifier<LogInState> {
  final LogInUsecase _logInUsecase;
  final CheckUserUsecase _checkUserUsecase;
  final TemplateCrudUsecase _templateCrudUsecase;
  final TemplateNotifier _templateNotifier;
  final StaffNotifier _staffNotifier;

  LogInNotifier(
    this._logInUsecase,
    this._checkUserUsecase,
    this._templateCrudUsecase,
    this._templateNotifier,
    this._staffNotifier,
  ) : super(LogInState());

  Future<void> logIn({
    required String id,
    required String password,
  }) async {
    try {
      setLoading(true);

      final loginResult =
          await _logInUsecase.execute(userId: id, password: password);

      state = state.copyWith(
        authUser: loginResult.authUser,
      );
      _templateNotifier.setList(loginResult.templateList);
      _staffNotifier.setList(loginResult.staffList);

      setLoading(false);

      // initializeApp();
    } catch (e) {
      setLoading(false);
      rethrow;
    }
  }

  Future<void> checkUser() async {
    setLoading(true);

    final authUser = await _checkUserUsecase.execute();

    state = state.copyWith(authUser: authUser);
    setLoading(false);

    // initializeApp();
  }

  Future<void> initializeApp() async {
    await _templateCrudUsecase.getAllTemplates();
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
