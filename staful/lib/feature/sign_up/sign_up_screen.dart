import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/sign_up/sign_up_provider.dart';
import 'package:staful/ui/screens/login_screen.dart';
import 'package:staful/domain/utils/form_validators.dart';
import 'package:staful/ui/widgets/confirmation_dialog.dart';
import 'package:staful/ui/widgets/submit_button_widget.dart';
import 'package:staful/ui/widgets/validation_text_input_widget.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool isIdInputFilled = false;
  bool isPwInputFilled = false;
  bool isPwConfirmInputFilled = false;
  bool isBusinessNameInputFilled = false;
  bool isBusinessOwnerNameInputFilled = false;
  bool isOpeningDateInputFilled = false;

  final idInputController = TextEditingController();
  final pwInputController = TextEditingController();
  final pwConfirmInputController = TextEditingController();
  final businessNameInputController = TextEditingController();
  final businessOwnerNameInputController = TextEditingController();
  final openingDateInputController = TextEditingController();
  late final List<TextEditingController> controllers = [
    idInputController,
    pwInputController,
    pwConfirmInputController,
    businessNameInputController,
    businessOwnerNameInputController,
    openingDateInputController
  ];

  bool get isSubmitButtonEnabled =>
      isIdInputFilled &&
      isPwInputFilled &&
      isPwConfirmInputFilled &&
      isBusinessNameInputFilled &&
      isBusinessOwnerNameInputFilled &&
      isOpeningDateInputFilled;

  @override
  void dispose() {
    // TODO: implement dispose
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void handleSubmit() async {
    try {
      await ref.read(signUpProvider.notifier).signUp(
            id: idInputController.text,
            password: pwInputController.text,
            name: businessOwnerNameInputController.text,
            businessName: businessNameInputController.text,
            openingDate: DateTime.parse(openingDateInputController.text),
          );

      // 위젯이 마운트된 상태에서만 UI 업데이트 수행
      if (!mounted) return;

      ConfirmationDialog.show(
          context: context,
          onConfirm: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              ),
          showCancelButton: false,
          message: "회원가입이 완료되었습니다");
    } catch (e) {
      ConfirmationDialog.show(
          context: context,
          onConfirm: () {},
          showCancelButton: false,
          message: "회원가입에 실패했습니다. \n다시 시도해주세요.\n \n$e ");
    }
  }

  void handleIdInputChanged(String text) {
    setState(() {
      isIdInputFilled = validateId(text) == null;
    });
  }

  void handlePwInputChanged(String text) {
    setState(() {
      isPwInputFilled = validatePw(text) == null;
    });
  }

  void handlePwConfirmInputChanged(String text) {
    setState(() {
      isPwConfirmInputFilled =
          arePasswordsMatching(pwInputController.text, text) == null;
    });
  }

  void handleBusinessNameInputChanged(String text) {
    setState(() {
      isBusinessNameInputFilled = validateBusinessName(text) == null;
    });
  }

  void handleBusinessOwnerNameInputChanged(String text) {
    setState(() {
      isBusinessOwnerNameInputFilled = validateName(text) == null;
    });
  }

  void handleOpeningDateInputChanged(String text) {
    setState(() {
      isOpeningDateInputFilled = text.isNotEmpty;
    });
  }

  void clearAllInputs() {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    const double inputGap = 12;

    Future<void> showCalendar() async {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (date != null) {
        openingDateInputController.text = date.toIso8601String().split('T')[0];
      }
    }

    final signUpState = ref.watch(signUpProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(
            icon: const Icon(Icons.language_outlined),
            onPressed: () => context.setLocale(
              Localizations.localeOf(context).toString() == "ko_KR"
                  ? const Locale('en', 'US')
                  : const Locale('ko', 'KR'),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 80,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "signup".tr(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  // 사용자 정보 입력 필드
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "userInfo".tr(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: clearAllInputs,
                                  child: Text(
                                    "deleteAll".tr(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: inputGap),
                            ValidationTextInputWidget(
                              label: "id".tr(),
                              placeHolder: "idPlaceholder".tr(),
                              onChanged: handleIdInputChanged,
                              errorText: validateId(idInputController.text),
                              controller: idInputController,
                            ),
                            const SizedBox(height: inputGap),
                            ValidationTextInputWidget(
                              label: "password".tr(),
                              placeHolder: "typeyourpw".tr(),
                              onChanged: handlePwInputChanged,
                              errorText: validatePw(pwInputController.text),
                              controller: pwInputController,
                              shouldObscureText: true,
                            ),
                            const SizedBox(height: inputGap),
                            ValidationTextInputWidget(
                              label: "confirmPw".tr(),
                              placeHolder: "typeyourpw2".tr(),
                              onChanged: handlePwConfirmInputChanged,
                              errorText: arePasswordsMatching(
                                  pwInputController.text,
                                  pwConfirmInputController.text),
                              controller: pwConfirmInputController,
                              shouldObscureText: true,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  // 매장 정보 입력 필드
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "storeInfo".tr(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: inputGap),
                            ValidationTextInputWidget(
                              label: "storeName".tr(),
                              placeHolder: "매장명을 입력하세요.",
                              onChanged: handleBusinessNameInputChanged,
                              errorText: validateBusinessName(
                                  businessNameInputController.text),
                              controller: businessNameInputController,
                            ),
                            const SizedBox(height: inputGap),
                            ValidationTextInputWidget(
                              label: "ownerName".tr(),
                              placeHolder: "ownerNamePlaceholder".tr(),
                              onChanged: handleBusinessOwnerNameInputChanged,
                              errorText: validateName(
                                  businessOwnerNameInputController.text),
                              controller: businessOwnerNameInputController,
                            ),
                            const SizedBox(height: inputGap),
                            GestureDetector(
                              onTap: () => showCalendar(),
                              child: AbsorbPointer(
                                absorbing: true,
                                child: ValidationTextInputWidget(
                                  label: "openingDate".tr(),
                                  placeHolder: "개업일을 입력하세요.",
                                  onChanged: handleOpeningDateInputChanged,
                                  controller: openingDateInputController,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  // 회원가입 버튼
                  GestureDetector(
                    onTap: () => {
                      if (isSubmitButtonEnabled)
                        {
                          handleSubmit(),
                        }
                    },
                    child: SubmitButtonWidget(
                      color: isSubmitButtonEnabled
                          ? null
                          : Theme.of(context).disabledColor,
                      text: "signup".tr(),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          // 로딩 상태 오버레이
          if (signUpState.isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
