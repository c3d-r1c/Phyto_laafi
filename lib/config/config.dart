import 'package:flutter/painting.dart';


  int IDPredict = 0;

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
      title: 'Detection des maladies', image: 'assets/images/img1.png'),
  OnBoarding(
      title: 'Surveillance à distance', image: 'assets/images/img2.png'),
  OnBoarding(
      title: 'Assistance en cas de pathologie', image: 'assets/images/img3.png'),
];
