import 'package:staful/feature/auth/data/dto/sign_up_dto.dart';
import 'package:staful/feature/auth/domain/model/user_model.dart';

abstract class UserInterface {
  Future<void> saveUserToFirestore({
    required String uid,
    required SignUpDto signUpDto,
  });
  Future<UserModel> fetchUserFromFirestore({
    required String uid,
  });
  Future<void> saveUserToPreferences({
    required UserModel user,
  });
  Future<UserModel> loadUserFromPreferences();
}