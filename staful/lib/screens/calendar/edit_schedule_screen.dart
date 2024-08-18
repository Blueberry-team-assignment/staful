import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/screens/calendar/calendar_screen.dart';

class EditScheduleScreen extends StatelessWidget {
  const EditScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: NavigateBackAppBar(context),
      body: const Center(
        child: Text("스케줄 수정!!!"),
      ),
    );
  }
}
