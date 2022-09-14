import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phyto_laafi/config/functions.dart';

class SplashWidget extends StatelessWidget {
  final int time;
  final Widget child, nextPage;

  const SplashWidget(
      {Key? key, this.time = 3, required this.child, required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: time), () {
      route(context, nextPage, close: true);
    });
    return child;
  }
}
