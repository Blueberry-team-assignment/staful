import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnItemContainer extends StatelessWidget {
  final Widget? content;
  final Color? color;

  const ColumnItemContainer({
    super.key,
    this.content,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: content,
    );
  }
}
