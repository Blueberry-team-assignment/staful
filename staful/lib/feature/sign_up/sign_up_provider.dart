import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/auth_repository_impl.dart';
import 'package:staful/data/user_repository_impl.dart';
import 'package:staful/dto/sign_up_dto.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>((ref) {
  final authInterface = ref.read(authRepositoryProvider);
  final userInterface = ref.read(userRepositoryProvider);
  return SignUpNotifier(authInterface, userInterface);
});

class SignUpNotifier extends StateNotifier<SignUpState> {
  final AuthInterface _authInterface;
  final UserInterface _userInterface;

  SignUpNotifier(this._authInterface, this._userInterface)
      : super(SignUpState());

  Future<void> signUp({
    required String id,
    required String password,
    required String name,
    required String businessName,
    required DateTime openingDate,
  }) async {
    try {
      final signUpDto = SignUpDto(
        id: id,
        password: password,
        name: name,
        businessName: businessName,
        openingDate: openingDate,
      );

      final signUpResult = await _authInterface.signUp(
        userId: signUpDto.id,
        password: signUpDto.password,
      );

      await _userInterface.saveUserToFirestore(
        uid: signUpResult,
        signUpDto: signUpDto,
      );

      state = SignUpState();
    } catch (e) {
      print(e);
    }
  }
}

class SignUpState {
  final SignUpDto? signUpDto;
  final bool isLoading;

  SignUpState({
    this.signUpDto,
    this.isLoading = false,
  });
}
