import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 150,
        ),
        Text(
          "회원가입",
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ]),
    );
  }
}
