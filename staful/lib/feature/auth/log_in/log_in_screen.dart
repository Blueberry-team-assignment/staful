import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/log_in/log_in_provider.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/feature/calendar/ui/calendar_screen.dart';
import 'package:staful/feature/auth/sign_up/sign_up_screen.dart';
import 'package:staful/ui/widgets/confirmation_dialog.dart';
import 'package:staful/ui/widgets/submit_button_widget.dart';
import 'package:staful/ui/widgets/validation_text_input_widget.dart';
import 'package:staful/utils/navigation_helpers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isIdInputFilled = false;
  bool isPwInputFilled = false;
  final idInputController = TextEditingController();
  final pwInputController = TextEditingController();
  bool get isLoginButtonEnabled =>
      idInputController.text.isNotEmpty && pwInputController.text.isNotEmpty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAutoLogin();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    idInputController.dispose();
    pwInputController.dispose();
    super.dispose();
  }

  Future<void> _checkAutoLogin() async {
    final loginProvider = ref.read(logInProvider.notifier);
    await loginProvider.checkAutoLogin();
    final loginState = ref.read(logInProvider);

    if (loginState.isLoggedIn) {
      openPage(
        context,
        const AppLayout(
          appBarType: "logo",
          showBottomNavigationBar: true,
          child: CalendarScreen(),
        ),
      );
    }
  }

  Future<void> handleLogin() async {
    try {
      // 로그인 프로바이더 사용
      await ref.read(logInProvider.notifier).logIn(
            id: idInputController.text,
            password: pwInputController.text,
          );

      // UI 업데이트
      if (!mounted) return;

      openPage(
        context,
        const AppLayout(
          appBarType: "logo",
          showBottomNavigationBar: true,
          child: CalendarScreen(),
        ),
      );
    } catch (e) {
      ConfirmationDialog.show(
        context: context,
        onConfirm: () {},
        showCancelButton: false,
        message: "로그인에 실패했습니다. \n다시 시도해주세요.\n \n$e ",
      );
    }
  }

  void handleIdInputChanged(String text) {
    setState(() {
      isIdInputFilled = text.isNotEmpty;
    });
  }

  void handlePwInputChanged(String text) {
    setState(() {
      isPwInputFilled = text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logInState = ref.watch(logInProvider);

    return Stack(
      children: [
        Scaffold(
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
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'loginLine'.tr(),
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            "STAFull",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 42,
                        child: ValidationTextInputWidget(
                          label: "id".tr(),
                          placeHolder: "idPlaceholder".tr(),
                          onChanged: handleIdInputChanged,
                          controller: idInputController,
                          shouldValidate: false,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 42,
                        child: ValidationTextInputWidget(
                          label: "password".tr(),
                          placeHolder: "typeyourpw".tr(),
                          onChanged: handlePwInputChanged,
                          controller: pwInputController,
                          shouldObscureText: true,
                          shouldValidate: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () => {if (isLoginButtonEnabled) handleLogin()},
                    child: SubmitButtonWidget(
                      color: isLoginButtonEnabled
                          ? null
                          : Theme.of(context).disabledColor,
                      text: "login".tr(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text("findId".tr()),
                      const Text(("  |  ")),
                      Text("findPw".tr()),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      Text(
                        "loginWithGoogle".tr(),
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: Image.asset(
                          'lib/assets/icons/icon_google.png',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("notuser".tr()),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                              // fullscreenDialog: true,
                            ),
                          );
                        },
                        child: Text(
                          "signup".tr(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (logInState.isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
