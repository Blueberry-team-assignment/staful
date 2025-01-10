import 'package:staful/feature/auth/domain/model/user_model.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';

class LogInState {
  final bool isLoading;
  final UserModel? authUser;
  final bool isLoggedIn;
  final List<StaffModel> staffList;

  LogInState({
    this.isLoading = false,
    this.authUser,
    this.isLoggedIn = false,
    this.staffList = const [],
  });

  LogInState copyWith({
    bool? isLoading,
    UserModel? authUser,
    bool? isLoggedIn,
    List<StaffModel>? staffList,
  }) {
    return LogInState(
      isLoading: isLoading ?? this.isLoading,
      authUser: authUser ?? this.authUser,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      staffList: staffList ?? this.staffList,
    );
  }
}
