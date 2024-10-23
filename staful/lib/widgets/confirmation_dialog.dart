import 'package:flutter/material.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/widgets/simple_text_button_widget.dart';
import 'package:staful/widgets/submit_button_widget.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final bool showCancelButton;

  const ConfirmationDialog({
    super.key,
    this.title = "",
    required this.message,
    required this.onConfirm,
    this.onCancel,
    this.showCancelButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title.isNotEmpty)
              Text(
                title,
                style: contentTitleStyle,
              ),
            const SizedBox(height: 10),
            Text(
              message,
              style: contentTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // if (showCancelButton)
                //   Expanded(
                //     child: GestureDetector(
                //       onTap: onCancel ?? () => Navigator.of(context).pop(),
                //       child: SubmitButtonWidget(
                //         color: Theme.of(context).disabledColor,
                //         textColor: Colors.black,
                //         text: "취소",
                //       ),
                //     ),
                //   ),
                Expanded(
                  child: GestureDetector(
                    onTap: onConfirm,
                    child: SubmitButtonWidget(
                      color: Theme.of(context).primaryColor,
                      text: "확인",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static void show({
    required BuildContext context,
    required VoidCallback onConfirm,
    bool showCancelButton = true,
    String title = "",
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: title,
          message: message,
          onConfirm: () {
            onConfirm();
            Navigator.of(context).pop(); // 팝업 닫기
            Navigator.of(context).pop(); // 이전페이지로 돌아가기
          },
          onCancel: () {
            Navigator.of(context).pop(); // 팝업 닫기
          },
          showCancelButton: showCancelButton,
        );
      },
    );
  }
}
