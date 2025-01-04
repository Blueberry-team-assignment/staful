import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/data/repositories/auth_repository.dart';
import 'package:staful/feature/auth/domain/interfaces/auth_interface.dart';
import 'package:staful/feature/auth/domain/model/user_model.dart';

final loginUsecaseProvider = Provider((ref) {
  final authInterface = ref.watch(authRepositoryProvider);
  return LogInUsecase(authInterface);
});

class LogInUsecase {
  final AuthInterface _authInterface;

  LogInUsecase(this._authInterface);

  Future<UserModel> execute({
    required String userId,
    required String password,
  }) async {
    final authUser =
        await _authInterface.logIn(userId: userId, password: password);
    return authUser;
  }
}
