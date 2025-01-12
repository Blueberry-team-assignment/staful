import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/data/repositories/auth_repository.dart';
import 'package:staful/feature/auth/domain/interfaces/auth_interface.dart';
import 'package:staful/feature/auth/domain/model/user_model.dart';

final checkUserUsecaseProvider = Provider((ref) {
  final authInterface = ref.watch(authRepositoryProvider);
  return CheckUserUsecase(authInterface);
});

class CheckUserUsecase {
  final AuthInterface _authInterface;

  CheckUserUsecase(this._authInterface);

  Future<UserModel?> execute() async {
    final authUser = await _authInterface.checkUser();

    return authUser;
  }
}
