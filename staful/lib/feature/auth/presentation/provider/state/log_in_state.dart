import 'package:staful/feature/auth/domain/model/user_model.dart';

class LogInState {
  final bool isLoading;
  final UserModel? authUser;
  final bool isLoggedIn;

  LogInState({
    this.isLoading = false,
    this.authUser,
    this.isLoggedIn = false,
  });

  LogInState copyWith({
    bool? isLoading,
    UserModel? authUser,
    bool? isLoggedIn,
  }) {
    return LogInState(
      isLoading: isLoading ?? this.isLoading,
      authUser: authUser ?? this.authUser,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
