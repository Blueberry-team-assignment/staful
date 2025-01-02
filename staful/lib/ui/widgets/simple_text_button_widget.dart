import 'package:flutter/material.dart';
import 'package:staful/utils/app_styles.dart';

class SimpleTextButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const SimpleTextButtonWidget({
    super.key,
    this.onPressed,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Theme.of(context).primaryColorLight,
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 10,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyleConfig(size: 13, color: Theme.of(context).primaryColor)
            .setTextStyle()
            .copyWith(
              textBaseline: TextBaseline.alphabetic,
            ),
      ),
    );
  }
}
