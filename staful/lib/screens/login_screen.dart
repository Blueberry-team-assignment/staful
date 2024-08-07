import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/constants/constants.dart';
import 'package:staful/screens/join_screen.dart';
import 'package:staful/widgets/text_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isIdInputFilled = false;
  bool isPwInputFilled = false;
  bool get isLoginButtonEnabled => isIdInputFilled && isPwInputFilled;

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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "간단한 직원관리",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      "STAFull",
                      style: TextStyle(
                          fontFamily: "MainFont",
                          color: Color(mainColor),
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
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
                    placeHoler: "아이디를 입력하세요.",
                    onChanged: handleIdInputChanged,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 42,
                  child: TextInputWidget(
                    placeHoler: "비밀번호를 입력하세요.",
                    onChanged: handlePwInputChanged,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(
                              isLoginButtonEnabled ? mainColor : subColor),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text(
                          "로그인",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Text("아이디 찾기"),
                    Text(("  |  ")),
                    Text("비밀번호 찾기"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Column(
              children: [
                const Text("sns로 간편하게 시작하기"),
                IconButton(
                  onPressed: () => {},
                  icon: Image.asset(
                    'lib/assets/icon_google.png',
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
                const Text("아직 회원이 아니시라면"),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinScreen(),
                        // fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Text(
                    "회원가입하기",
                    style: TextStyle(
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
    );
  }
}
