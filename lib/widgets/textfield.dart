import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final Color backgroundColor;
  final String hint;
  final double radius;

  const CTextField(
      {Key? key,
      this.backgroundColor = Colors.greenAccent,
      required this.hint,
      this.radius = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      filled: true,
      fillColor: backgroundColor,
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xC2BDBD), fontSize: 20),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius)),
    ));
  }
}
