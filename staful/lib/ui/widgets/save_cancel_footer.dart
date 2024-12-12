import 'package:flutter/material.dart';
import 'package:staful/domain/utils/app_styles.dart';

class SaveCancelFooter extends StatelessWidget {
  final VoidCallback onTabUndoBtn;
  final VoidCallback onTapSaveBtn;

  const SaveCancelFooter({
    super.key,
    required this.onTabUndoBtn,
    required this.onTapSaveBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Theme.of(context).disabledColor,
                  ),
                ),
                onPressed: onTabUndoBtn,
                child: const Text(
                  "취소",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: onTapSaveBtn,
                child: const Text(
                  "저장",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: bottomMargin, // bottomMargin 값 사용
        ),
      ],
    );
  }
}
