import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/auth_repository.dart';
import 'package:staful/data/user_repository.dart';
import 'package:staful/dto/auth/sign_up_dto.dart';

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
      state = state.copyWith(isLoading: true);

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
        uid: signUpResult.user!.uid,
        signUpDto: signUpDto,
      );
    } catch (e) {
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
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

  SignUpState copyWith({
    SignUpDto? signUpDto,
    bool? isLoading,
  }) {
    return SignUpState(
      signUpDto: signUpDto ?? this.signUpDto,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
