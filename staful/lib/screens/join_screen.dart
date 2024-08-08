import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/utils/form_validators.dart';
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

  bool get isSubmitButtonEnabled =>
      isIdInputFilled &&
      isPwInputFilled &&
      isPwConfirmInputFilled &&
      isStoreNameInputFilled &&
      isStoreOwnerNameInputFilled &&
      isOpenDateInputFilled;

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

  void handlePwConfirmInputChanged(String text) {
    setState(() {
      isPwConfirmInputFilled = text.isNotEmpty;
    });
  }

  void handleStoreNameInputChanged(String text) {
    setState(() {
      isStoreNameInputFilled = text.isNotEmpty;
    });
  }

  void handleStoreOwnerNameInputChanged(String text) {
    setState(() {
      isStoreOwnerNameInputFilled = text.isNotEmpty;
    });
  }

  void handleOpenDateInputChanged(String text) {
    setState(() {
      isOpenDateInputFilled = text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
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
                        const Text(
                          "기본 정보",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputWidget(
                          placeHoler: "아이디를 입력하세요.",
                          onChanged: handleIdInputChanged,
                          validator: validateId,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputWidget(
                          placeHoler: "비밀번호를 입력하세요.",
                          onChanged: handlePwInputChanged,
                          validator: validatePw,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputWidget(
                          placeHoler: "비밀번호를 다시 한번 입력하세요.",
                          onChanged: handlePwConfirmInputChanged,
                          validator: validatePw,
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
                          height: 10,
                        ),
                        TextInputWidget(
                          placeHoler: "매장명",
                          onChanged: handleStoreNameInputChanged,
                          validator: validateName,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputWidget(
                          placeHoler: "사장님 이름",
                          onChanged: handleStoreOwnerNameInputChanged,
                          validator: validateName,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputWidget(
                          placeHoler: "개업일",
                          onChanged: handleOpenDateInputChanged,
                          validator: validateId,
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
