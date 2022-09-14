import 'package:flutter/material.dart';
import 'package:phyto_laafi/views/echangePage.dart';
import 'package:phyto_laafi/views/homePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
     
      body: Center(child: _screen.elementAt(_selectedIndex),),
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
