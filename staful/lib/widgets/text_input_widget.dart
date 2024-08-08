import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/utils/form_validators.dart';

class TextInputWidget extends StatefulWidget {
  final String placeHoler;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final String? Function(String?)? validator;

  const TextInputWidget({
    super.key,
    required this.placeHoler,
    required this.onChanged,
    this.errorText,
    this.validator,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final inputController = TextEditingController();
  String? errorText;

  @override
  void initState() {
    super.initState();
    inputController.addListener(onInputChanged);
  }

  @override
  void dispose() {
    inputController.removeListener(onInputChanged);
    inputController.dispose();
    super.dispose();
  }

  void onInputChanged() {
    widget.onChanged(inputController.text);
    setState(() {
      errorText = widget.validator?.call(inputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      style: const TextStyle(
        fontSize: 14,
      ),
      validator: widget.validator,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: IconButton(
            onPressed: inputController.clear,
            icon: SvgPicture.asset(
              'lib/assets/icon_clear.svg',
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          )),
          hintText: widget.placeHoler,
          errorText: errorText,
          errorMaxLines: 2,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          )),
    );
  }
}
