import 'package:flutter/material.dart';
import 'package:phyto_laafi/views/ajoutChamp.dart';
import 'package:phyto_laafi/views/detailChamp.dart';
import 'package:phyto_laafi/views/listChamp.dart';
import 'package:phyto_laafi/views/dashboardChamp.dart';
import 'package:phyto_laafi/views/maps.dart';

import 'diagnostisque.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
       appBar: AppBar(
        title:  Container(child: const Image(image: AssetImage("assets/images/logo.png",),width: 100,)),
        centerTitle: true,
        elevation: 0.0,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10)
            )
          ),
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon(
            Icons.menu, 
            color: Colors.white,
            )
          ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon
              (Icons.account_circle_rounded, 
              color: Colors.white,
              )
            )],
        backgroundColor: Colors.transparent,
      ),

      body: Stack(
        children: [
          Container(
              height: size.height * 0.9,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/images/background 02.png")
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.water_drop_outlined, size: 25,color: Colors.white,),
                        Text("Humidité", style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Text(
                      "25%", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 75),
                      )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text("Ensoleillement", style: TextStyle(color: Colors.white),),
                        Icon(Icons.sunny, size: 25,color: Colors.white,),
                      ],
                    ),
                    Text(
                      "23°", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 75),
                      )
                  ],
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Expanded(
              child: 
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          primary: false,
                          crossAxisCount: 2,
                          children: [
                            // Menu Button 1
                            InkWell(
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50)
                                  ),
                                ),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/menu_icon_1.png", width: 120),
                                    const SizedBox(height: 0.0,),
                                    const Text("Mes Champs"),
                                  ],
                                ),
                              ),
                              onTap: () {
                                print("mes champs");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ListChamp()));
                              },
                            ),
                            // Menu Button 2
                            Card(
                              shape: const  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50)
                                  ),
                                ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/menu_icon_ 3.png", width: 100),
                                  const SizedBox(height: 5.0,),
                                  Text("Assistances")
                                ],
                              ),
                            ),
                            // Menu Button 3
                            InkWell(
                              child: Card(
                                shape: const  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50)
                                    ),
                                  ),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                        Image.asset("assets/images/menu_icon_5.png", width: 100,),
                                        const SizedBox(height: 0.0,),
                                        Text("Menaces")
                                      ],
                                ),
                              ),
                              onTap: () {
                                print("mes champs");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MapsSCreen()));
                              },
                            ),
                            InkWell(
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50)
                                  ),
                                ),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/menu_icon_2.png", width: 100),
                                    const SizedBox(height: 5.0,),
                                    const Text("Diagnostique"),
                                  ],
                                ),
                              ),
                              onTap: () {
                                print("mes champs");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Diagnostique()));
                              },
                            )
                          ],
                        ),
                )
              ,),
          )
        ],
      ),
    );
  }
}