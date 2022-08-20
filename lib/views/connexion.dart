import 'package:flutter/material.dart';
import 'package:phyto_laafi/config/config.dart';
import 'package:phyto_laafi/config/functions.dart';
import 'package:phyto_laafi/views/authentification.dart';
import 'package:phyto_laafi/widgets/button.dart';

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: height(context) / 2.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Config.assets.splash_img))),
          ),
          const Text(
            "Entrez votre numéro de téléphone \n pour vous inscrire",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              const TextField(),
              const SizedBox(
                height: 25,
              ),
              CButton(
                  title: "Connexion",
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const Authentification()))
                      })
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
    ));
  }
}
