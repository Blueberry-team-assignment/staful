import 'package:flutter/material.dart';

class TextStyleConfig {
  final double? size;
  final Color? color;
  final FontWeight? weight;

  TextStyleConfig({
    this.size = 16,
    this.color = Colors.black,
    this.weight = FontWeight.bold,
  });

  TextStyle setTextStyle() {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
    );
  }
}

const double bottomMargin = 60;
