import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AjoutChamp extends StatefulWidget {
  const AjoutChamp({Key? key}) : super(key: key);

  @override
  State<AjoutChamp> createState() => _AjoutChampState();
}

class _AjoutChampState extends State<AjoutChamp> {
  final formKey = GlobalKey<FormState>();
  final nomChampController = TextEditingController();
  final SuperficieController = TextEditingController();
  final NombreCapteurController = TextEditingController();
  final IPAdressController = TextEditingController();

  @override
  void dispose() {
    nomChampController.dispose();
    SuperficieController.dispose();
    NombreCapteurController.dispose();
    IPAdressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Champ"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: nomChampController,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                ),
                validator: (value) {
                  if (value == null){
                    return 'Entre un nom';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: nomChampController,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(05.0))
                  ),
                ),
                validator: (value) {
                  if (value == null){
                    return 'Entre un nom';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: SuperficieController,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                ),
                validator: (value) {
                  if (value == null){
                    return 'Entre un nom';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: NombreCapteurController,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                ),
                validator: (value) {
                  if (value == null){
                    return 'Entre un nom';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: IPAdressController,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                ),
                validator: (value) {
                  if (value == null){
                    return 'Entre un nom';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8.0,),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  var NomChamp, Superficie, NombreCapteur, IPAdress;

                  if(formKey.currentState!.validate()){
                    NomChamp = nomChampController.value.text;
                    Superficie = SuperficieController.value.text;
                    NombreCapteur = NombreCapteurController.value.text;
                    IPAdress = IPAdressController.value.text;
                  }
                  print(NomChamp + "\n," + Superficie + "\n," + NombreCapteur + "\n," + IPAdress);
                }, 
                child: const Text("Save")),
            )
          ],
        )
      ),
    );
  }
}