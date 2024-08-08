import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/utils/form_validators.dart';

import 'package:staful/screens/login_screen.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: "MainFont",
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1e7e1c),
          primary: const Color(0xff1e7e1c),
          secondary: const Color(0xffd1d1d1),
          surface: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
