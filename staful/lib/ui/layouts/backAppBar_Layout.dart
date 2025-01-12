import 'package:flutter/material.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/utils/app_styles.dart';

class BackAppBarLayout extends StatelessWidget {
  final Widget scrollableArea;
  final Widget nonScrollableArea;

  const BackAppBarLayout({
    super.key,
    required this.scrollableArea,
    this.nonScrollableArea = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: scrollableArea,
              ),
            ),
            nonScrollableArea,
            const SizedBox(
              height: bottomMargin,
            ),
          ],
        ),
      ),
    );
  }
}
