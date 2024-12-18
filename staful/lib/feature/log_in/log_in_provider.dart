import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/auth_repository_impl.dart';
import 'package:staful/data/user_repository_impl.dart';
import 'package:staful/dto/log_in_dto.dart';

final logInProvider =
    StateNotifierProvider.autoDispose<LogInNotifier, LogInState>((ref) {
  final authInterface = ref.read(authRepositoryProvider);
  final userInterface = ref.read(userRepositoryProvider);
  return LogInNotifier(authInterface, userInterface);
});

class LogInNotifier extends StateNotifier<LogInState> {
  final AuthInterface _authInterface;
  final UserInterface _userInterface;

  LogInNotifier(this._authInterface, this._userInterface) : super(LogInState());

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

      // firestore에서 유저정보 fetch
      final authUser = await _userInterface.fetchUserFromFirestore(
          uid: logInResult.user!.uid);

      // sharedPreference에 유저정보 저장
      await _userInterface.saveUserToPreferences(
        uid: logInResult.user!.uid,
        id: authUser!.userId,
        businessName: authUser.businessName,
        name: authUser.name,
        openingDate: authUser.openingDate,
      );
    } catch (e) {
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class LogInState {
  final LogInDto? logInDto;
  final bool isLoading;

  LogInState({
    this.logInDto,
    this.isLoading = false,
  });

  LogInState copyWith({
    LogInDto? logInDto,
    bool? isLoading,
  }) {
    return LogInState(
      logInDto: logInDto ?? this.logInDto,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
