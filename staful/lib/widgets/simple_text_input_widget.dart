import 'package:flutter/material.dart';
import 'package:staful/widgets/validation_text_input_widget.dart';

class SimpleTextInputWidget extends StatefulWidget {
  final String placeHolder;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const SimpleTextInputWidget({
    super.key,
    required this.placeHolder,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<SimpleTextInputWidget> createState() => _SimpleTextInputWidgetState();
}

class _SimpleTextInputWidgetState extends State<SimpleTextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return ValidationTextInputWidget(
      placeHolder: widget.placeHolder,
      onChanged: widget.onChanged,
      controller: widget.controller,
    );
  }
}
