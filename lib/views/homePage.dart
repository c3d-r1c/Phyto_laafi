import 'package:flutter/material.dart';
import 'package:phyto_laafi/views/ajoutChamp.dart';
import 'package:phyto_laafi/views/detailChamp.dart';
import 'package:phyto_laafi/views/listChamp.dart';
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
            color: Colors.green,
            )
          ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.notifications, 
              color: Colors.yellowAccent
              )
            ), 
          IconButton(
            onPressed: (){}, 
            icon: const Icon
              (Icons.account_circle_rounded, 
              color: Colors.purple,
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
                                    const Text("Mes Champ"),
                                  ],
                                ),
                              ),
                              onTap: () {
                                print("mes champ");
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
                                        Text("Menances")
                                      ],
                                ),
                              ),
                              onTap: () {
                                print("mes champ");
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
                                print("mes champ");
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