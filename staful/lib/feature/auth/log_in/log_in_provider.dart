import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/auth_repository.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/models/user_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/data/user_repository.dart';
import 'package:staful/dto/auth/log_in_dto.dart';
import 'package:staful/feature/staff/staff_provider.dart';

final logInProvider =
    StateNotifierProvider.autoDispose<LogInNotifier, LogInState>((ref) {
  final authInterface = ref.read(authRepositoryProvider);
  final userInterface = ref.read(userRepositoryProvider);
  return LogInNotifier(authInterface, userInterface, ref);
});

class LogInNotifier extends StateNotifier<LogInState> {
  final AuthInterface _authInterface;
  final UserInterface _userInterface;
  final Ref _ref;

  LogInNotifier(
    this._authInterface,
    this._userInterface,
    this._ref,
  ) : super(LogInState());

  Future<void> logIn({
    required String id,
    required String password,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final logInDto = LogInDto(
        id: id,
        password: password,
      );

      final logInResult = await _authInterface.logIn(
        userId: logInDto.id,
        password: logInDto.password,
      );
      final uid = logInResult.user!.uid;

      // firestore에서 유저정보 fetch
      final authUser = await _userInterface.fetchUserFromFirestore(uid: uid);

      // sharedPreference에 유저정보 저장
      await _userInterface.saveUserToPreferences(user: authUser);

      state = state.copyWith(
        user: authUser,
        isLoading: false,
      );

      // 스태프, 템플릿 데이터 fetch
      await _ref.watch(staffNotifierProvider.notifier).fetchStaffList(uid);

      // _ref.read(templateNotifierProvider.notifier).fetch
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> checkAutoLogin() async {
    final user = _authInterface.checkUser();
    final savedUser = await _userInterface.loadUserFromPreferences();

    if (user?.uid == savedUser.uid) {
      await _ref
          .watch(staffNotifierProvider.notifier)
          .fetchStaffList(user!.uid);
      state = state.copyWith(isLoggedIn: true);
    } else {
      _authInterface.logOut();
      state = state.copyWith(isLoggedIn: false);
    }
  }
}

class LogInState {
  final LogInDto? logInDto;
  final bool isLoading;
  final User? user;
  final bool isLoggedIn;

  LogInState({
    this.logInDto,
    this.isLoading = false,
    this.user,
    this.isLoggedIn = false,
  });

  LogInState copyWith({
    LogInDto? logInDto,
    bool? isLoading,
    User? user,
    bool? isLoggedIn,
  }) {
    return LogInState(
      logInDto: logInDto ?? this.logInDto,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
