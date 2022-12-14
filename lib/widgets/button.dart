import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phyto_laafi/config/config.dart';

class CButton extends StatefulWidget {
  final String? title;
  final Function? onPressed;

  const CButton({Key? key, this.title, this.onPressed}) : super(key: key);

  @override
  State<CButton> createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            gradient:
                LinearGradient(colors: [Color(0xFF2aef58), Color(0xFF2ab77a)])),
        child: ElevatedButton(
          style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 90)),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: () {},
          child: Text(title = "connexion",
              style: const TextStyle(fontSize: 16, color: Color(0xFF2ab77a))),
        ));
  }
}