import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashboardChamp extends StatefulWidget {
  const DashboardChamp({Key? key}) : super(key: key);

  @override
  State<DashboardChamp> createState() => _DashboardChampState();
}

class _DashboardChampState extends State<DashboardChamp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tableau de bord"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: Expanded(
              child: Stack(
                fit: StackFit.loose,
                children:[  
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/champ.png")),
                    ),
                  ),
                   Container(
                    width: double.infinity,
                    color: Colors.green.withOpacity(0.9),
                  ),
                  GridView.count(
                    crossAxisCount: 3 ,
                    children: [
                      Card(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.sunny,color: Colors.white,),
                            Text("lux",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.sunny,color: Colors.white,),
                            Text("lux",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.sunny,color: Colors.white,),
                            Text("lux",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.sunny,color: Colors.white,),
                            Text("lux",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      )
                    ],
                    
                    ),
                ]
              ),
            ),
          ),
          Row(
            children: [
              Icon(Icons.settings),
              Text("Paramtres")
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15,bottom: 5),
            child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.4)),
                   ),
          ),
          Row(
            children: [
              Text("Etat :",
                style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Column(
                    children: [
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.green,
                        child: Container(
                          height:   30,
                          width: 80,
                          child: const Center(child: Text("Activer",style: TextStyle(color: Colors.white),)),
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,),
                            borderRadius:BorderRadius.circular(5),
                          ),
                         child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(child: Text("Desactiver",)),
                         ),
                          height: 30,
                          width:  80,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}