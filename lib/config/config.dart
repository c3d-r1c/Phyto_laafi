import 'package:flutter/painting.dart';

class Config {
  static final colors = _Color();
  static final assets = _Assets();
}

class _Color {
  final primaryColor = Color(0xFF2AEF58);
  final primatyTextColor = Color(0xFF000000);
}

class _Assets {
  final splash_img = "assets/images/logo.png";
}

class OnBoarding {
  final String title;
  final String image;

  OnBoarding({required this.title, required this.image});
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
      title: 'Lorem ipsum dolor sit amet', image: 'assets/images/img1.png'),
  OnBoarding(
      title: 'Lorem ipsum dolor sit amet', image: 'assets/images/img2.png'),
  OnBoarding(
      title: 'Lorem ipsum dolor sit amet', image: 'assets/images/img3.png'),
];
