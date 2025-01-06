import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/data/repositories/auth_repository.dart';
import 'package:staful/feature/auth/domain/interfaces/auth_interface.dart';
import 'package:staful/feature/auth/domain/model/user_model.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/template/data/repositories/template_repository.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';

final loginUsecaseProvider = Provider((ref) {
  final authInterface = ref.watch(authRepositoryProvider);
  final templateInterface = ref.watch(templateRepositoryProvider);
  final staffInterface = ref.watch(staffRepositoryProvider);
  return LogInUsecase(authInterface, staffInterface, templateInterface);
});

class LogInUsecase {
  final AuthInterface _authInterface;
  final TemplateInterface _templateInterface;
  final StaffInterface _staffInterface;

  LogInUsecase(
    this._authInterface,
    this._staffInterface,
    this._templateInterface,
  );

  Future<LoginResult> execute({
    required String userId,
    required String password,
  }) async {
    final authUser =
        await _authInterface.logIn(userId: userId, password: password);

    final uid = authUser.uid;
    final staffList = await _staffInterface.fetchAllStaffs(uid: uid);
    final templateList = await _templateInterface.fetchAllTemplates(uid: uid);

    return LoginResult(
      authUser: authUser,
      staffList: staffList,
      templateList: templateList,
    );
  }
}

class LoginResult {
  final UserModel authUser;
  final List<StaffModel> staffList;
  final List<TemplateModel> templateList;

  LoginResult({
    required this.authUser,
    required this.staffList,
    required this.templateList,
  });
}
