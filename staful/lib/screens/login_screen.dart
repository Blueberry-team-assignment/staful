import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/screens/calendar_screen.dart';
import 'package:staful/utils/form_validators.dart';
import 'package:staful/screens/join_screen.dart';
import 'package:staful/widgets/submit_button_widget.dart';
import 'package:staful/widgets/text_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isIdInputFilled = false;
  bool isPwInputFilled = false;
  // bool get isLoginButtonEnabled => isIdInputFilled && isPwInputFilled;
  final idInputController = TextEditingController();
  final pwInputController = TextEditingController();
  bool get isLoginButtonEnabled =>
      idInputController.text.isNotEmpty && pwInputController.text.isNotEmpty;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    idInputController.dispose();
    pwInputController.dispose();
    super.dispose();
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                    child: TextInputWidget(
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
                    child: TextInputWidget(
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
                onTap: () => {
                  if (isLoginButtonEnabled)
                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CalendarScreen(),
                        ),
                      )
                    }
                },
                child: SubmitButtonWidget(
                  isEnabled: isLoginButtonEnabled,
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
                          builder: (context) => const JoinScreen(),
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
    );
  }
}
