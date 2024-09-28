import 'package:flutter/material.dart';
import 'package:staful/layouts/app_layout.dart';

class PayrollTemplateDetailScreen extends StatelessWidget {
  const PayrollTemplateDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigateBackAppBar(context),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Center(
          child: Text("h1"),
        ),
      ),
    );
  }
}
