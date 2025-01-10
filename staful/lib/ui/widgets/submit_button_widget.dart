import 'package:flutter/material.dart';
import 'package:staful/utils/app_styles.dart';

class SubmitButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? textColor;

  const SubmitButtonWidget({
    super.key,
    this.text,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final primeColor = Theme.of(context).primaryColor;
    final subColor = Theme.of(context).colorScheme.secondary;

    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 48,
            decoration: BoxDecoration(
              color: color ?? primeColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Text(
              text ?? "",
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
