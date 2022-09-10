import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phyto_laafi/views/connexion.dart';
import 'package:phyto_laafi/views/diagnostisque.dart';
import 'package:phyto_laafi/views/home.dart';
import 'package:phyto_laafi/views/maps.dart';
import 'package:phyto_laafi/views/splashscreen.dart';
import './widgets/splash.dart';
import './views/page.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  //SharedPreferences pref = await SharedPreferences.getInstance();
  //seenOnboard = pref.getBool('seenOnboard') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phyto laafi',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashWidget(
        nextPage:
          seenOnboard == true ? const Connexion() : const OnBoardingPage(),
        child: SplashScreen(),
      ),
    );
  }
}
