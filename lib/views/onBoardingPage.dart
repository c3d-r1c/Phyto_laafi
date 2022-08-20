import 'package:flutter/material.dart';
import 'package:phyto_laafi/config/config.dart';
import 'package:phyto_laafi/main.dart';
import 'package:phyto_laafi/views/connexion.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: const BoxDecoration(
        color: 0 != 0 ? Colors.grey : Colors.green,
        //color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenOnboard() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //seenOnboard = prefs.getBool('seenOnboard');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSeenOnboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 7,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingContents.length,
              itemBuilder: (context, index) => Column(children: [
                const SizedBox(height: 100),
                Text(
                  onboardingContents[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    onboardingContents[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      TextSpan(text: 'je suis un texte'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                currentPage == onboardingContents.length - 1
                    ? MyTextButton(
                        buttonName: 'Commencer',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Connexion()));
                        },
                        bgColor: Colors.green,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnboardingNavBtn(
                            name: 'Skip',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Connexion()));
                            },
                          ),
                          Row(
                            children: List.generate(
                              onboardingContents.length,
                              (index) => dotIndicator(index),
                            ),
                          ),
                          OnboardingNavBtn(
                            name: 'Next',
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(microseconds: 1000),
                                curve: Curves.bounceInOut,
                              );
                            },
                          )
                        ],
                      ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 50,
        width: 400,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(backgroundColor: bgColor),
        ),
      ),
    );
  }
}

class OnboardingNavBtn extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const OnboardingNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
          child: Text(name),
        ));
  }
}
