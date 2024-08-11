import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/utils/form_validators.dart';

class TextInputWidget extends StatefulWidget {
  final String label;
  final String placeHolder;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final TextEditingController controller;
  final bool shouldObscureText;
  final bool shouldValidate;

  const TextInputWidget({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.onChanged,
    this.errorText,
    required this.controller,
    this.shouldObscureText = false,
    this.shouldValidate = true,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onInputChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onInputChanged);
    widget.controller.dispose();
    super.dispose();
  }

  void onInputChanged() {
    widget.onChanged(widget.controller.text);
  }

  bool get isValidInputText =>
      widget.controller.text.isNotEmpty && widget.errorText == null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.shouldObscureText,
      style: const TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
          labelText: widget.label,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon:
              widget.controller.text.isNotEmpty && widget.shouldValidate == true
                  ? (isValidInputText
                      ? const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        )
                      : IconButton(
                          onPressed: widget.controller.clear,
                          icon: SvgPicture.asset(
                            'lib/assets/icons/icon_clear.svg',
                          ),
                        ))
                  : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          )),
          hintText: widget.placeHolder,
          errorText: widget.errorText,
          errorMaxLines: 2,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          )),
    );
  }
}
