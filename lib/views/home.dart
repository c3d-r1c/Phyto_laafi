import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Container(child: const Image(image: AssetImage("assets/images/logo.png",),width: 100,)),
      centerTitle: true,
      leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu, color: Colors.green,)),
      actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, color: Colors.yellowAccent)), IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle_rounded, color: Colors.purple,))],
      backgroundColor: Colors.white,),
      body: PageView(
        controller: pageController,
      
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon:Icon(Icons.home),label: "Acceuil"),
        BottomNavigationBarItem(icon:Icon(Icons.message),label: "Echange"),
        BottomNavigationBarItem(icon:Icon(Icons.notifications),label: "Notification"),],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,),
    );
  }
}
