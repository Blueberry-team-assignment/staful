import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.isEnabled,
    required this.text,
  });

  final bool isEnabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    final primeColor = Theme.of(context).colorScheme.primary;
    final subColor = Theme.of(context).colorScheme.secondary;

    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 48,
            decoration: BoxDecoration(
              color: isEnabled ? primeColor : subColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
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
