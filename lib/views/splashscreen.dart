import 'package:flutter/material.dart';
import 'package:phyto_laafi/config/config.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Config.assets.splash_img,
            width: 250,
          )
        ],
      )),
    );
  }
}
