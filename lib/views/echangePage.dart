import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EchangePage extends StatefulWidget {
  const EchangePage({Key? key}) : super(key: key);

  @override
  State<EchangePage> createState() => _EchangePageState();
}

class _EchangePageState extends State<EchangePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Text("Echange");
  }
}