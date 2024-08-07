import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/constants/constants.dart';

class TextInputWidget extends StatefulWidget {
  final String placeHoler;
  final ValueChanged<String> onChanged;

  const TextInputWidget({
    super.key,
    required this.placeHoler,
    required this.onChanged,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final inputController = TextEditingController();

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
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      style: const TextStyle(
        fontSize: 14,
      ),
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
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(subColor),
          )),
          hintText: widget.placeHoler,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          )),
    );
  }
}
