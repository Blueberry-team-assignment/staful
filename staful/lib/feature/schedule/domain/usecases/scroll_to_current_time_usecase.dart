import 'package:flutter/material.dart';

class ScrollToCurrentTimeUsecase {
  final ScrollController controller;
  final double screenWidth;
  final double cellWidth;
  final double profileWidth;

  ScrollToCurrentTimeUsecase({
    required this.controller,
    required this.screenWidth,
    required this.cellWidth,
    required this.profileWidth,
  });

  void call() {
    final date = DateTime.now();
    final currentHour = date.hour;
    final currentMinute = date.minute;
    final double targetOffset = (currentHour + 2) * cellWidth +
        (currentMinute / 60.0) * cellWidth -
        (screenWidth / 2) +
        profileWidth;

    controller.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 1300),
      curve: Curves.easeInOutBack,
    );
  }
}
