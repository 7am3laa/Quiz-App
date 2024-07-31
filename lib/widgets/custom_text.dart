import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
