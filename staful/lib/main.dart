import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const int mainColor = 0xff1e7e1c;
    const int subColor = 0xffd1d1d1;

    return MaterialApp(
      home: Scaffold(
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
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "STAFull",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
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
                    height: 40,
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.highlight_remove_outlined,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: '아이디를 입력하세요',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.highlight_remove_outlined,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: '비밀번호를 입력하세요',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(subColor),
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
                      icon: const Icon(Icons.logo_dev_outlined))
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("아직 회원이 아니시라면"),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "회원가입하기",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
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
