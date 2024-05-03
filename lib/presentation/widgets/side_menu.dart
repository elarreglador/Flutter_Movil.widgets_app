import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  // opcion predeterminada del menu
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      // opcion predeterminada del menu
      selectedIndex: navDrawerIndex,
      // cambia la opcion predeterminada al pulsar una de ellas
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(" ⛵ Mi NavigationDrawer")
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart_outlined), 
          label: Text("Opcion Num.1")
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart_outlined), 
          label: Text("Opcion Num.2")
        )
      ],
    );
  }
}