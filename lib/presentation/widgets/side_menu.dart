import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

// MENU LATERAL DERECHO

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

    // Indica el espacio hasta el borde superior (top) de pantalla
    // este modo sabemos si hay un notch para la camara
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    final bool hasNotch = paddingTop > 35 ? true : false;


    return NavigationDrawer(
      backgroundColor: Color.fromARGB(255, 189, 189, 189),
      // opcion predeterminada del menu
      selectedIndex: navDrawerIndex,
      // cambia la opcion predeterminada al pulsar una de ellas
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [ // elementos del menu

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 30, 16, 0), //left,top,right,bottom
          child: Text(" ⛵ Mi NavigationDrawer")
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 16, 0), //left,top,right,bottom
          child: Text(" 🔝 Padding.top = $paddingTop"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 16, 0), //left,top,right,bottom
          child: Text(" 🕳️ hasNotch= paddingTop>35? = $hasNotch"),
        ),

        // Barra separadora
        const Padding( 
          padding: EdgeInsets.fromLTRB(30,0,20,0),
          child: Divider(),  
        ),
        const Padding( 
          padding: EdgeInsets.fromLTRB(30,0,20,0),
          child: Text("OPCIONES HECHAS A MANO")
        ),

        // Dos opciones hechas a mano
        const NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart_outlined), 
          label: Text("Opcion Num.1")
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart_outlined), 
          label: Text("Opcion Num.2")
        ),

        // Barra separadora
        const Padding( 
          padding: EdgeInsets.fromLTRB(30,0,20,0),
          child: Divider(),  
        ),
        const Padding( 
          padding: EdgeInsets.fromLTRB(30,0,20,0),
          child: Text("OPCIONES")
        ),


        // Primeras 3 opciones de la lista
        ...appMenuItems
          .sublist(0,3) // solo 3 elementos
          .map((item) => NavigationDrawerDestination(
            icon: Icon ( item.icon ), 
            label: Text ( item.title)
          )
        ),

        // Barra separadora
        const Padding( 
          padding: EdgeInsets.fromLTRB(30,0,20,0),
          child: Divider(),  
        ),
        const Padding( 
          padding: EdgeInsets.fromLTRB(30,0,20,0),
          child: Text("OTRAS OPCIONES")
        ),

        // opciones desde la 3 en adelante
        ...appMenuItems
          .sublist(3) // solo 3 elementos
          .map((item) => NavigationDrawerDestination(
            icon: Icon ( item.icon ), 
            label: Text ( item.title)
          )
        ),
      ],
    );
  }
}