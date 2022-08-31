import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phyto_laafi/views/dashboardChamp.dart';
import 'package:phyto_laafi/views/echangePage.dart';
import 'package:phyto_laafi/views/homePage.dart';

class DetailChamp extends StatefulWidget {
  const DetailChamp({Key? key}) : super(key: key);

  @override
  State<DetailChamp> createState() => _DetailChampState();
}

class _DetailChampState extends State<DetailChamp> {

  int _selectedIndex = 0; 

  PageController pageController = PageController();

  final List<Widget> _screen =  <Widget>[
    const HomePage(),
    const EchangePage(),
    const Center(child: Text("notification"),),
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPageChange(int index){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information sur le Champ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Container(
                decoration:const BoxDecoration( 
                  borderRadius: BorderRadius.all(Radius.circular(25))),
                height: 220,
                child: Stack(
                   children:[ ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child:const  Image(
                      image: AssetImage("assets/images/champ.png"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Center(
                      child: Text("champ de maïs N°1",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                      ),
                    ),
                  )
               ]
              )
            ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Column(
                children: [
                  Text("surface"),
                  SizedBox(height: 5,),
                  Text(
                    "1000 m2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, 
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  Text("Capteurs"),
                  SizedBox(height: 5),
                  Text(
                    "01",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
               InkWell(
                onTap: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardChamp()));
                }),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                    children: [
                      Icon(Icons.remove_red_eye,color: Colors.green),
                      SizedBox(height: 5,),
                      Text("voir plus",
                        style: TextStyle(color: Colors.green),),
                    ],
                               ),
                 ),
               ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15,bottom: 5),
            child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.2)),
                   ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Niveau de risque"),
              SizedBox(height: 5,),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Sain"),
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.green,
                        child: Container(
                           height:   40,
                          width: 80,
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Risquer"),
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.yellow[100],
                        child: Container(
                           height:   40,
                          width: 80,
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Danger"),
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.red[100],
                        child: Container(
                           height:   40,
                          width: 80,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15,bottom: 5),
            child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.2)),
                   ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    children: [
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.orange,
                        child: Container(
                           height:   50,
                          width: 70,
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
                        color: Colors.green,
                        child: Container(
                           height:   50,
                          width: 70,
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
                        color: Colors.red,
                        child: Container(
                          height:   50,
                          width: 70,
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
                        color: Colors.blueGrey,
                        child: Container(
                           height:   50,
                          width: 70,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: "Acceuil"
            ),
          BottomNavigationBarItem(
            icon:Icon(Icons.message),
            label: "Echange"
            ),
          BottomNavigationBarItem(
            icon:Icon(Icons.notifications),
            label: "Notification"
            ),
          ],
          onTap: _onItemTap,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,),
    );
    
  }
}