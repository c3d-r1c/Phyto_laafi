import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phyto_laafi/views/home.dart';
import 'package:phyto_laafi/widgets/button.dart';
import 'package:phyto_laafi/config/functions.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:phyto_laafi/config/config.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  int start = 30;

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      () {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              height: height(context) / 3.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pin-code-password.png"),
                ),
              ),
            ),
            const Text(
              "Un code OTP a été envoyé sur votre \n numéro de téléphone",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    // print("Completed: " + pin);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Si vous n'avez pas reçus le code dans ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "00:$start secondes",
                          style: TextStyle(color: Colors.green))
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: (() {
                    startTimer();
                  }),
                  child: BoutonPers(),
                ),
              ]),
            ),
            Container(
              alignment: Alignment.center,
              height: height(context) / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/picto.png"))),
            ),
          ],
        ),
      ),
    );
  }
}

class BoutonPers extends StatelessWidget {
  const BoutonPers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [
            Color(0xFF2aef58), 
            Color(0xFF2ab77a)
          ])
        ),
        child: Center(
          child: Text("Connexion",
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold),),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      },
    );
  }
}