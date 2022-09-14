import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phyto_laafi/views/detailChamp.dart';
import 'package:phyto_laafi/views/echangePage.dart';
import 'package:phyto_laafi/views/homePage.dart';

class ListChamp extends StatefulWidget {
  const ListChamp({Key? key}) : super(key: key);

  @override
  State<ListChamp> createState() => _ListChampState();
}

class _ListChampState extends State<ListChamp> {

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
        title: Text("Mes Champ"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          InkWell(onTap: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailChamp()));
          }),
           child: ChampItemWidget())
        ],
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
        selectedItemColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      onPressed: () {
        
      },
      ),
    );
  }
}

class ChampItemWidget extends StatelessWidget {
  const ChampItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.green[50],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
             Container(
                    decoration:const BoxDecoration( 
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                    height: 80,
                    child: ClipRRect(
                     borderRadius: BorderRadius.circular(5.0),
                     child:const  Image(
                       image: AssetImage("assets/images/champ.png"),
                     ),
                      )
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 10),
                    child: const Text("Champ de Maîs N°1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ),
                  Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Surface"),
                            Text("1000 m2")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Capteurs"),
                            Text("01")
                          ],
                        ),
                      )
                    ]
                  ),
                  Row(
                children: [
                  Column(
                    children: [
                      Text("Sain",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)
                      ),
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.green,
                        child: Container(
                           height:   20,
                          width: 40,
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Risquer",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)
                        ),
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.yellow[100],
                        child: Container(
                           height:   20,
                          width: 40,
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Danger",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)
                        ),
                      Card(
                        shape: const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                        color: Colors.red[100],
                        child: Container(
                           height:   20,
                          width: 40,
                        )
                      ),
                    ],
                  ),
                ],
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    
  }
}