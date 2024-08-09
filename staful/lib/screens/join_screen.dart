import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/utils/form_validators.dart';
import 'package:staful/widgets/calendar_widget.dart';
import 'package:staful/widgets/submit_button_widget.dart';
import 'package:staful/widgets/text_input_widget.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  bool isIdInputFilled = false;
  bool isPwInputFilled = false;
  bool isPwConfirmInputFilled = false;
  bool isStoreNameInputFilled = false;
  bool isStoreOwnerNameInputFilled = false;
  bool isOpenDateInputFilled = false;

  final idInputController = TextEditingController();
  final pwInputController = TextEditingController();
  final pwConfirmInputController = TextEditingController();
  final storeNameInputController = TextEditingController();
  final storeOwnerNameInputController = TextEditingController();
  final openDateInputController = TextEditingController();

  bool get isSubmitButtonEnabled =>
      isIdInputFilled &&
      isPwInputFilled &&
      isPwConfirmInputFilled &&
      isStoreNameInputFilled &&
      isStoreOwnerNameInputFilled &&
      isOpenDateInputFilled;

  void handleIdInputChanged(String text) {
    setState(() {
      // isIdInputFilled = text.isNotEmpty;
    });
  }

  void handlePwInputChanged(String text) {
    setState(() {
      // isPwInputFilled = text.isNotEmpty;
    });
  }

  void handlePwConfirmInputChanged(String text) {
    setState(() {
      // isPwConfirmInputFilled = text.isNotEmpty;
    });
  }

  void handleStoreNameInputChanged(String text) {
    setState(() {
      // isStoreNameInputFilled = text.isNotEmpty;
    });
  }

  void handleStoreOwnerNameInputChanged(String text) {
    setState(() {
      // isStoreOwnerNameInputFilled = text.isNotEmpty;
    });
  }

  void handleOpenDateInputChanged(String text) {
    setState(() {
      // isOpenDateInputFilled = text.isNotEmpty;
    });
  }

  void clearAllInputs() {
    final controllers = [
      idInputController,
      pwInputController,
      pwConfirmInputController,
      storeNameInputController,
      storeOwnerNameInputController,
      openDateInputController
    ];

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
        openDateInputController.text = date.toString().split(" ")[0];
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 100,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "회원가입",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "기본 정보",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: clearAllInputs,
                              child: const Text(
                                "모두 지우기",
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: inputGap,
                        ),
                        TextInputWidget(
                          label: "아이디",
                          placeHolder: "아이디를 입력하세요.",
                          onChanged: handleIdInputChanged,
                          errorText: validateId(idInputController.text),
                          controller: idInputController,
                        ),
                        const SizedBox(
                          height: inputGap,
                        ),
                        TextInputWidget(
                          label: "비밀번호",
                          placeHolder: "비밀번호를 입력하세요.",
                          onChanged: handlePwInputChanged,
                          errorText: validatePw(pwInputController.text),
                          controller: pwInputController,
                          shouldObscureText: true,
                        ),
                        const SizedBox(
                          height: inputGap,
                        ),
                        TextInputWidget(
                          label: "비밀번호 확인",
                          placeHolder: "비밀번호를 다시 한번 입력하세요.",
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
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "매장 정보",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: inputGap,
                        ),
                        TextInputWidget(
                          label: "매장명",
                          placeHolder: "매장명을 입력하세요.",
                          onChanged: handleStoreNameInputChanged,
                          errorText:
                              validateStoreName(storeNameInputController.text),
                          controller: storeNameInputController,
                        ),
                        const SizedBox(
                          height: inputGap,
                        ),
                        TextInputWidget(
                          label: "사장님 이름",
                          placeHolder: "이름을 입력하세요.",
                          onChanged: handleStoreOwnerNameInputChanged,
                          errorText:
                              validateName(storeOwnerNameInputController.text),
                          controller: storeOwnerNameInputController,
                        ),
                        const SizedBox(
                          height: inputGap,
                        ),
                        GestureDetector(
                          onTap: () => showCalendar(),
                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextInputWidget(
                              label: "개업일",
                              placeHolder: "개업일을 입력하세요.",
                              onChanged: handleOpenDateInputChanged,
                              controller: openDateInputController,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              SubmitButtonWidget(
                isEnabled: isSubmitButtonEnabled,
                text: "회원가입",
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => {Navigator.pop(context)},
                    child: const Text(
                      "이전으로",
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
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
