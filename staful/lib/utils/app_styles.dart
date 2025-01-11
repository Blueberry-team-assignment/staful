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

final titleStyle = TextStyleConfig(size: 24).setTextStyle();
final contentTitleStyle =
    TextStyleConfig(size: 14, weight: FontWeight.normal).setTextStyle();
final contentTextStyle = TextStyleConfig(size: 20).setTextStyle();

const double bottomMargin = 30;
const double borderRadius = 5;
